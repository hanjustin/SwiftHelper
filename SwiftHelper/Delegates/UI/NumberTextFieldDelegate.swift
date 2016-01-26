//
//  NumberTextFieldDelegate.swift
//  SwiftHelper
//
//  Created by Justin on 1/19/16.
//
//

import Foundation
import UIKit

public protocol NumberTextFieldRelayedDelegate: class {
    // Required
    func textField(textField: UITextField, didEndEditingWithNumber newNumber: Double?)       // Called when user enters new number
    
    // Optional
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    func textFieldDidBeginEditing(textField: UITextField)
    func textFieldShouldClear(textField: UITextField) -> Bool
    func textFieldShouldReturn(textField: UITextField) -> Bool
    func textFieldShouldEndEditing(textField: UITextField) -> Bool
}

public extension NumberTextFieldRelayedDelegate {
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
    
    }
    
    func textFieldShouldClear(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
}


public class NumberTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    public weak var relayedDelegate: NumberTextFieldRelayedDelegate?
    
    public init(relayedDelegate: NumberTextFieldRelayedDelegate? = nil) {
        self.relayedDelegate = relayedDelegate
    }

    public func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        return relayedDelegate?.textFieldShouldBeginEditing(textField) ?? true
    }
    
    public func textFieldDidBeginEditing(textField: UITextField) {
        relayedDelegate?.textFieldDidBeginEditing(textField)
    }
    
    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        return true
    }
    
    public func textFieldShouldClear(textField: UITextField) -> Bool {
        return relayedDelegate?.textFieldShouldClear(textField) ?? true
    }
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        return relayedDelegate?.textFieldShouldReturn(textField) ?? true
    }
    
    public func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return relayedDelegate?.textFieldShouldEndEditing(textField) ?? true
    }
    
    public func textFieldDidEndEditing(textField: UITextField) {
        relayedDelegate?.textField(textField, didEndEditingWithNumber: nil)
    }
}
