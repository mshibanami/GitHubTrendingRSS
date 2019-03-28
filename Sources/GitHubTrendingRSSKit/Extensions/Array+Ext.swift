//
//  Created by Manabu Nakazawa on 28/3/19.
//  

import Foundation

public extension Array {
    public func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}
