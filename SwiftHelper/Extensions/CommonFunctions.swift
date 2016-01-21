//
//  CommonFunctions.swift
//  SwiftHelper
//
//  Created by Justin on 1/20/16.
//
//

import Foundation


/*
    class MyClass {
        var property1 = 1
        var property2 = "Hi"
    }


    ArrayForm((0, 1, 2, 3))                 // [0, 1, 2, 3]
    ArrayForm(MyClass())                    // [1, "Hi"]
*/

public func ArrayForm(value: Any) -> [Any] {
    var mirror: Mirror? = Mirror(reflecting: value)
    var propertyValues = [Any]()
    
    while let currentMirror = mirror {
        propertyValues += currentMirror.children.map { $0.value }
        
        // Get superclass if it exists
        mirror = currentMirror.superclassMirror()
    }
    
    return propertyValues
}


/*
    class MyClass {
        var property1 = 1
        var property2 = "Hi"
    }

    DictionaryForm(MyClass())               // ["property1" : 1, "property2" : "Hi"]
*/

public func DictionaryForm(value: Any) -> [String : Any] {
    var mirror: Mirror? = Mirror(reflecting: value)
    var objectDictionary = [String : Any]()
    
    while let currentMirror = mirror {
        for (propertyName, value) in currentMirror.children {
            if let key = propertyName { objectDictionary[key] = value }
        }
        
        // Get superclass if it exists
        mirror = currentMirror.superclassMirror()
    }
    
    return objectDictionary
}

