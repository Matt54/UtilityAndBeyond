//
//  String+Extensions.swift
//
//
//  Created by Matt Pfeiffer on 11/19/23.
//

import Foundation

public extension String {
    var floatingPointFilteredText: String {
        var filtered = self.filter {
            "0123456789.".contains($0)
        }
        
        if filtered.filter({ $0 == "." }).count > 1 {
            let lastIndex = filtered.lastIndex(of: ".") ?? filtered.endIndex
            filtered.remove(at: lastIndex)
        }

        if filtered != self {
            return filtered
        }
        return self
    }
}
