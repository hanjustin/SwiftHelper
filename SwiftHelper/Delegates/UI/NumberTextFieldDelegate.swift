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
    
}

public class NumberTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    
    
    public weak var delegate: NumberTextFieldRelayedDelegate?
    
    
    public func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
    }
    
    public func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
    }
    
    public func textFieldShouldClear(textField: UITextField) -> Bool {
        
    }
    
    public func textFieldDidEndEditing(textField: UITextField) {
        
    }
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        
    }
    
    public func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        
    }
}