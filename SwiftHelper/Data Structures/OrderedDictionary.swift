//
//  OrderedDictionary.swift
//  SwiftHelper
//
//  Created by Justin on 1/17/16.
//
//

import Foundation

public struct OrderedDictionary<KeyType: Hashable, ValueType> {
    
    private var keys = [KeyType]()
    private var dictionary = [KeyType : ValueType]()
    
    public var count: Int {
        return keys.count
    }
    
    
    public init() { }
    
    public subscript(key: KeyType) -> ValueType? {
        get {
            return dictionary[key]
        }
        
        set {
            if !keys.contains(key) {
                keys.append(key)
            }
            
            dictionary[key] = newValue
        }
    }
    
    mutating func insert(value: ValueType, forKey key: KeyType, atIndex index: Int) -> ValueType? {
        var newIndex = index
        let existingValue = dictionary[key]
        
        if existingValue != nil, let existingIndex = keys.indexOf(key) {
            if existingIndex < index { newIndex-- }
            
            keys.removeAtIndex(existingIndex)
        }
        
        keys.insert(key, atIndex: newIndex)
        dictionary[key] = value
        
        return existingValue
    }

    // index subscript
    // sort ordering?
    // Removing, return something?
    
    
}


