//
//  OrderedDictionary.swift
//  SwiftHelper
//
//  Created by Justin on 1/17/16.
//
//

import Foundation

public struct OrderedDictionary<KeyType: Hashable, ValueType> {
    
    private var orderedKeys = [KeyType]()
    private var keysToValues = [KeyType : ValueType]()

    
    public typealias Element = (key: KeyType, value: ValueType)
    
    public var count: Int {
        return orderedKeys.count
    }
    
    // MARK: - Initialization
    
    public init() { }
    
    public init(elements: [Element]) {
        for element in elements {
            self[key: element.key] = element.value
        }
    }
    
    public init(elements: Element...) {
        self.init(elements: elements)
    }
    
    // MARK: - Key methods
    
    public var keysInOrder: [KeyType] {
        return orderedKeys
    }
    
    public func containsKey(key: KeyType) -> Bool {
        return keysToValues[key] != nil
    }
    
    public func indexOfKey(key: KeyType) -> Int? {
        return orderedKeys.indexOf(key)
    }
    
    public subscript(key key: KeyType) -> ValueType? {
        get {
            return keysToValues[key]
        }
        
        set {
            if !orderedKeys.contains(key) { orderedKeys.append(key) }
            
            keysToValues[key] = newValue
        }
    }
    
    public mutating func updateValue(newValue: ValueType, forKey key: KeyType) -> ValueType? {
        let existingValue = keysToValues[key]
        keysToValues[key] = newValue
        
        if existingValue == nil { orderedKeys.append(key) }
        
        return existingValue
    }
    
    public mutating func removeValueForKey(key: KeyType) -> ValueType? {
        if let index = indexOfKey(key) { orderedKeys.removeAtIndex(index) }
        
        return keysToValues.removeValueForKey(key)
    }
    
    // MARK: - Index methods

    public subscript(index index: Int) -> Element {
        get {
            return elementAtIndex(index)
        }
        
        set(newElement) {
            insertElement(newElement, atIndex: index)
        }
    }
    
    public func keyAtIndex(index: Int) -> KeyType {
        return orderedKeys[index]
    }
    
    public func valueAtIndex(index: Int) -> ValueType {
        return keysToValues[keyAtIndex(index)]!         // Implicitly unwrapped as invalid index should throw 'Array index out of range' error
    }
    
    public func elementAtIndex(index: Int) -> Element {
        return (keyAtIndex(index), valueAtIndex(index))
    }
    
    public mutating func insertElement(element: Element, atIndex index: Int) -> ValueType? {
        return insert(element.value, forKey: element.key, atIndex: index)
    }
    
    public mutating func insert(value: ValueType, forKey key: KeyType, atIndex index: Int) -> ValueType? {
        var newIndex = index
        let existingValue = keysToValues[key]
        
        if existingValue != nil, let existingIndex = orderedKeys.indexOf(key) {
            if existingIndex < index { newIndex-- }
            
            orderedKeys.removeAtIndex(existingIndex)
        }
        
        orderedKeys.insert(key, atIndex: newIndex)
        keysToValues[key] = value
        
        return existingValue
    }
    
    public mutating func removeAtIndex(index: Int) -> Element {
        let removedElement = elementAtIndex(index)
        orderedKeys.removeAtIndex(index)
        keysToValues[removedElement.key] = nil
        
        return removedElement
    }
}

