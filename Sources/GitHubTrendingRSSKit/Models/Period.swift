// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public enum Period: String, CaseIterable {
    case daily = "daily"
    case weekly = "weekly"
    case monthly = "monthly"

    public var trendingPageLink: URL {
        return URL(string: "\(Const.baseURL)/trending?since=\(rawValue)")!
    }
}
