// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public extension Sequence where Element: Sendable {
    func forEachConcurrent(
        maxConcurrency: Int,
        _ operation: @Sendable @escaping (Element) async throws -> Void
    ) async throws {
        precondition(maxConcurrency > 0, "maxConcurrency must be greater than 0")
        try await withThrowingTaskGroup(of: Void.self) { group in
            var inFlight = 0
            for element in self {
                if inFlight >= maxConcurrency {
                    try await group.next()
                    inFlight -= 1
                }
                group.addTask {
                    try await operation(element)
                }
                inFlight += 1
            }
            try await group.waitForAll()
        }
    }
}
