// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

actor RequestCooldown {
    private var resumeAt: Date = .distantPast

    func beginCooldown(for interval: TimeInterval) {
        resumeAt = max(resumeAt, Date().addingTimeInterval(interval))
    }

    func waitUntilReady() async throws {
        while true {
            let remaining = resumeAt.timeIntervalSinceNow
            guard remaining > 0 else {
                return
            }
            try await Task.sleep(nanoseconds: UInt64(remaining * 1_000_000_000))
        }
    }
}

actor RequestPacer {
    private let minInterval: TimeInterval
    private var nextSlot: Date = .distantPast

    init(minInterval: TimeInterval) {
        self.minInterval = minInterval
    }

    func waitTurn() async throws {
        let now = Date()
        let slot = max(nextSlot, now)
        nextSlot = slot.addingTimeInterval(minInterval)
        let delay = slot.timeIntervalSince(now)
        if delay > 0 {
            try await Task.sleep(nanoseconds: UInt64(delay * 1_000_000_000))
        }
    }
}

final class HostRequestGate: Sendable {
    let semaphore: AsyncSemaphore
    let cooldown: RequestCooldown = .init()
    let pacer: RequestPacer?

    init(limit: Int, minRequestInterval: TimeInterval? = nil) {
        semaphore = AsyncSemaphore(limit: limit)
        pacer = minRequestInterval.map { RequestPacer(minInterval: $0) }
    }
}

actor HostRequestGateRegistry {
    private let defaultLimit: Int
    private let limitsByHost: [String: Int]
    private let minRequestIntervalsByHost: [String: TimeInterval]
    private var gates: [String: HostRequestGate] = [:]

    init(
        defaultLimit: Int,
        limitsByHost: [String: Int],
        minRequestIntervalsByHost: [String: TimeInterval] = [:]
    ) {
        self.defaultLimit = defaultLimit
        self.limitsByHost = limitsByHost
        self.minRequestIntervalsByHost = minRequestIntervalsByHost
    }

    func gate(forHost host: String) -> HostRequestGate {
        if let gate = gates[host] {
            return gate
        }
        let gate = HostRequestGate(
            limit: limitsByHost[host] ?? defaultLimit,
            minRequestInterval: minRequestIntervalsByHost[host]
        )
        gates[host] = gate
        return gate
    }
}
