//
//  Created by Manabu Nakazawa on 17/3/19.
//

import Foundation

public enum DownloadError: Error {
    case noData
    case noResponce
    case unknown
    case invalidURL
    case unsupportedFormat
}
