//
//  Created by Manabu Nakazawa on 17/3/19.
//

import Foundation

public enum DownloadError: Error {
    case unknown
    case unknownUnreplyable
    case invalidURL
    case unsupportedFormat
    case failedFetching
}
