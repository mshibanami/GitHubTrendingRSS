// Copyright (c) 2026 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public actor AsyncCache<Key: Hashable & Sendable, Value: Sendable> {
    private var tasks: [Key: Task<Value, Error>] = [:]

    public init() {}

    public func value(
        for key: Key,
        compute: @Sendable @escaping () async throws -> Value
    ) async throws -> Value {
        if let existing = tasks[key] {
            return try await existing.value
        }
        let task = Task { try await compute() }
        tasks[key] = task
        do {
            return try await task.value
        } catch {
            tasks[key] = nil
            throw error
        }
    }
}
