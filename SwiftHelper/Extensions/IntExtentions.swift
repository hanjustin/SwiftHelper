//
//  IntExtentions.swift
//  SwiftHelper
//
//  Created by Justin on 1/11/16.
//
//

import Foundation

public extension Int {
    
    var isEven: Bool     { return self % 2 == 0 }
    
    var isOdd: Bool      { return !isEven }
    
    var numOfDigits: Int { return String(abs(self)).characters.count }
    
    static func randomNum(min min: Int, max: Int) -> Int {
        guard max > min else { return min }
        
        let exclusiveRange = UInt32((max - min) + 1)     // arc4random(3) returns 0, 1, 2 so need to add 1
        return Int(arc4random_uniform(exclusiveRange)) + min
    }
}
