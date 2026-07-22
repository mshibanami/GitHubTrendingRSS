// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import XCTest
@testable import GitHubTrendingRSSKit

final class DownloadManagerTests: XCTestCase {
    private actor ConcurrencyRecorder {
        private(set) var current: Int = 0
        private(set) var peak: Int = 0
        private(set) var total: Int = 0

        func enter() {
            current += 1
            peak = max(peak, current)
            total += 1
        }

        func leave() {
            current -= 1
        }
    }

    private actor CompletionRecorder {
        private(set) var completed: [String] = []

        func record(_ label: String) {
            completed.append(label)
        }
    }

    private actor AttemptCounter {
        private var counts: [String: Int] = [:]

        func nextAttempt(for key: String) -> Int {
            let next = (counts[key] ?? 0) + 1
            counts[key] = next
            return next
        }
    }

    private static func makeMockSession() -> URLSession {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockURLProtocol.self]
        configuration.httpMaximumConnectionsPerHost = 100
        return URLSession(configuration: configuration)
    }

    override func tearDown() {
        MockURLProtocol.handler = nil
        super.tearDown()
    }

    func testFetchAsync() async throws {
        let manager = DownloadManager()
        let result = try await manager.fetch(url: XCTUnwrap(URL(string: "https://example.com")))
        XCTAssertTrue(result.contains("Example Domain"))
    }

    func testLimitsConcurrentRequests() async throws {
        let recorder = ConcurrencyRecorder()
        MockURLProtocol.handler = { _ in
            await recorder.enter()
            try? await Task.sleep(nanoseconds: 20_000_000)
            await recorder.leave()
            return (statusCode: 200, data: Data("ok".utf8))
        }

        let manager = DownloadManager(
            maxConcurrentRequests: 2,
            session: Self.makeMockSession()
        )

        try await withThrowingTaskGroup(of: Void.self) { group in
            for i in 0..<10 {
                group.addTask {
                    let result = try await manager.fetch(url: XCTUnwrap(URL(string: "https://mock.example/\(i)")))
                    XCTAssertEqual(result, "ok")
                }
            }
            try await group.waitForAll()
        }

        let peak = await recorder.peak
        let total = await recorder.total
        XCTAssertLessThanOrEqual(peak, 2)
        XCTAssertEqual(total, 10)
    }

    func testReleasesPermitWhileWaitingForRetry() async throws {
        let attemptCounter = AttemptCounter()
        let completionRecorder = CompletionRecorder()

        MockURLProtocol.handler = { request in
            let path = request.url?.path ?? ""
            if path == "/retry" {
                let attempt = await attemptCounter.nextAttempt(for: "retry")
                return (statusCode: attempt == 1 ? 502 : 200, data: Data("retried".utf8))
            } else {
                return (statusCode: 200, data: Data("fast".utf8))
            }
        }

        let manager = DownloadManager(
            maxConcurrentRequests: 1,
            session: Self.makeMockSession()
        )
        manager.maxRetryCount = 1
        manager.retryInterval = 0.5

        try await withThrowingTaskGroup(of: Void.self) { group in
            group.addTask {
                let result = try await manager.fetch(url: XCTUnwrap(URL(string: "https://mock.example/retry")))
                XCTAssertEqual(result, "retried")
                await completionRecorder.record("retry")
            }
            group.addTask {
                try? await Task.sleep(nanoseconds: 100_000_000)
                let result = try await manager.fetch(url: XCTUnwrap(URL(string: "https://mock.example/fast")))
                XCTAssertEqual(result, "fast")
                await completionRecorder.record("fast")
            }
            try await group.waitForAll()
        }

        let completed = await completionRecorder.completed
        XCTAssertEqual(
            completed,
            ["fast", "retry"],
            "The fast request should finish while the first request is sleeping before its retry"
        )
    }

    func testNonRetryableStatusCodeFailsWithoutRetry() async throws {
        let attemptCounter = AttemptCounter()
        MockURLProtocol.handler = { _ in
            _ = await attemptCounter.nextAttempt(for: "request")
            return (statusCode: 404, data: Data())
        }

        let manager = DownloadManager(session: Self.makeMockSession())
        manager.retryInterval = 0.01

        do {
            _ = try await manager.fetch(url: XCTUnwrap(URL(string: "https://mock.example/missing")))
            XCTFail("Expected an error")
        } catch {
            XCTAssertEqual(error as? DownloadManager.Error, .failedFetching(statusCode: 404))
        }

        let attempts = await attemptCounter.nextAttempt(for: "request") - 1
        XCTAssertEqual(attempts, 1, "A non-retryable status code should not be retried")
    }

    func testRetryableStatusCodeRetriesUpToMaxRetryCount() async throws {
        let attemptCounter = AttemptCounter()
        MockURLProtocol.handler = { _ in
            _ = await attemptCounter.nextAttempt(for: "request")
            return (statusCode: 429, data: Data())
        }

        let manager = DownloadManager(session: Self.makeMockSession())
        manager.maxRetryCount = 2
        manager.retryInterval = 0.01

        do {
            _ = try await manager.fetch(url: XCTUnwrap(URL(string: "https://mock.example/limited")))
            XCTFail("Expected an error")
        } catch {
            XCTAssertEqual(error as? DownloadManager.Error, .failedFetching(statusCode: 429))
        }

        let attempts = await attemptCounter.nextAttempt(for: "request") - 1
        XCTAssertEqual(attempts, 3, "The initial attempt plus maxRetryCount retries")
    }
}

class MockURLProtocol: URLProtocol, @unchecked Sendable {
    nonisolated(unsafe) static var handler: (@Sendable (URLRequest) async throws -> (statusCode: Int, data: Data))?

    override class func canInit(with request: URLRequest) -> Bool {
        true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        request
    }

    override func startLoading() {
        guard let handler = Self.handler else {
            fatalError("MockURLProtocol.handler is not set")
        }
        let request = request
        Task {
            do {
                let (statusCode, data) = try await handler(request)
                let response = HTTPURLResponse(
                    url: request.url!,
                    statusCode: statusCode,
                    httpVersion: "HTTP/1.1",
                    headerFields: nil
                )!
                client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
                client?.urlProtocol(self, didLoad: data)
                client?.urlProtocolDidFinishLoading(self)
            } catch {
                client?.urlProtocol(self, didFailWithError: error)
            }
        }
    }

    override func stopLoading() {}
}
