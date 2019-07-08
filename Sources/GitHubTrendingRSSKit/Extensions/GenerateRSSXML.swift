// Copyright (c) 2018 Manabu Nakazawa. Licensed under the MIT license. See LICENSE in the project root for license information.

import Down
import Foundation
import SwiftSoup

public extension Repository {
    func readMeHTML() -> String? {
        if let readMe = readMe,
            let readMeContent = readMe.content,
            let readMeHTML = try? Down(markdownString: readMeContent).toHTML(),
            let parsedHTML = try? SwiftSoup.parse(readMeHTML) {

            let tagAttributesPairs = [
                "a": ["href"],
                "area": ["href"],
                "img": ["src", "longdesc", "usemap"],
                "link": ["href"],
                "blockquote": ["cite"]
            ]

            for (tag, attributes) in tagAttributesPairs {
                guard let elements = try? parsedHTML.getElementsByTag(tag) else {
                    continue
                }
                for element in elements {
                    for attribute in attributes {
                        guard let url = try? element.attr(attribute).prefixDeleted(prefix: "/"),
                            let baseURL = readMe.fileRootURL,
                            var absoluteURL = URL(string: url, relativeTo: baseURL)?.absoluteString else {
                                continue
                        }
                        if absoluteURL != url {
                            if absoluteURL.hasSuffix(".svg") && tag == "img" && attribute == "src" {
                                absoluteURL += "?sanitize=true"
                            }

                            _ = try? element.attr(attribute, absoluteURL)
                        }
                    }
                }
            }
            return (try? parsedHTML.body()?.html())
        }
        return nil
    }
}
