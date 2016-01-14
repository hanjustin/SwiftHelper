//
//  TEST.swift
//  SwiftHelper
//
//  Created by Justin on 1/11/16.
//
//

import Foundation

extension Int {
    public var isEven: Bool     { return self % 2 == 0 }
    
    public var isOdd: Bool      { return !self.isEven }
    
    public var numOfDigits: Int { return String(abs(self)).characters.count }
}