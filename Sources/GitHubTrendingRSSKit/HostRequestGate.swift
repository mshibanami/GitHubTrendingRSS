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

final class HostRequestGate: Sendable {
    let semaphore: AsyncSemaphore
    let cooldown: RequestCooldown = .init()

    init(limit: Int) {
        semaphore = AsyncSemaphore(limit: limit)
    }
}

actor HostRequestGateRegistry {
    private let defaultLimit: Int
    private let limitsByHost: [String: Int]
    private var gates: [String: HostRequestGate] = [:]

    init(defaultLimit: Int, limitsByHost: [String: Int]) {
        self.defaultLimit = defaultLimit
        self.limitsByHost = limitsByHost
    }

    func gate(forHost host: String) -> HostRequestGate {
        if let gate = gates[host] {
            return gate
        }
        let gate = HostRequestGate(limit: limitsByHost[host] ?? defaultLimit)
        gates[host] = gate
        return gate
    }
}
