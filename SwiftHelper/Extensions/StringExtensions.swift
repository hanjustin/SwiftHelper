//
//  StringExtensions.swift
//  SwiftHelper
//
//  Created by Justin on 1/26/16.
//
//

import Foundation

public extension String {
    
    var length: Int { return characters.count }
    
    mutating func removeCharacters(fromIndex startIndex: Int, toIndex endIndex: Int) {
        let subStringRange = Range(start: self.startIndex.advancedBy(startIndex), end: self.startIndex.advancedBy(endIndex))
        self.removeRange(subStringRange)
    }
    
    subscript(range: Range<Int>) -> String {
        get {
            let start = self.startIndex.advancedBy(range.startIndex)
            let end = startIndex.advancedBy(range.endIndex)
            return self[start..<end]
        }
    }
}