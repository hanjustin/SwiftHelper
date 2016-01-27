//
//  StringExtensions.swift
//  SwiftHelper
//
//  Created by Justin on 1/26/16.
//
//

import Foundation

public extension String {
    
    mutating func removeCharacters(fromIndex startIndex: Int, toIndex endIndex: Int) {
        let subStringRange = Range(start: self.startIndex.advancedBy(startIndex), end: self.startIndex.advancedBy(endIndex))
        self.removeRange(subStringRange)
    }
}