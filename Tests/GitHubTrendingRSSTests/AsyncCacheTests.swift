// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation
import GitHubTrendingRSSKit
import XCTest

final class AsyncCacheTests: XCTestCase {
    private actor Counter {
        private(set) var count: Int = 0

        @discardableResult
        func increment() -> Int {
            count += 1
            return count
        }
    }

    private struct DummyError: Error {}

    func testComputesOncePerKey() async throws {
        let cache: AsyncCache<String, Int> = AsyncCache()
        let counter = Counter()

        for _ in 0..<3 {
            let value = try await cache.value(for: "a") {
                await counter.increment()
            }
            XCTAssertEqual(value, 1)
        }

        let differentKeyValue = try await cache.value(for: "b") {
            await counter.increment()
        }
        XCTAssertEqual(differentKeyValue, 2)

        let count = await counter.count
        XCTAssertEqual(count, 2)
    }

    func testCoalescesConcurrentRequests() async throws {
        let cache: AsyncCache<String, Int> = AsyncCache()
        let counter = Counter()

        try await withThrowingTaskGroup(of: Int.self) { group in
            for _ in 0..<10 {
                group.addTask {
                    try await cache.value(for: "a") {
                        try await Task.sleep(nanoseconds: 10_000_000)
                        return await counter.increment()
                    }
                }
            }
            for try await value in group {
                XCTAssertEqual(value, 1)
            }
        }

        let count = await counter.count
        XCTAssertEqual(count, 1)
    }

    func testRetriesAfterFailure() async throws {
        let cache: AsyncCache<String, Int> = AsyncCache()
        let counter = Counter()

        do {
            _ = try await cache.value(for: "a") {
                await counter.increment()
                throw DummyError()
            }
            XCTFail("Expected an error to be thrown")
        } catch {
            XCTAssertTrue(error is DummyError)
        }

        let value = try await cache.value(for: "a") {
            await counter.increment()
        }
        XCTAssertEqual(value, 2)
    }
}
