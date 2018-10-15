// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Foundation

public protocol PageLinkable: Hashable {
    var href: String { get set }
}

public extension PageLinkable {
    public func url(ofPeriod period: Period) -> URL {
        let path = URL(string: href)!.path

        var components = URLComponents(
            url: Const.gitHubBaseURL,
            resolvingAgainstBaseURL: false)!

        components.path = path
        components.queryItems = [
            URLQueryItem(name: "since", value: period.rawValue)]

        return components.url!
    }
}
