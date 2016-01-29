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
    func textField(textField: UITextField, didEndEditingWithNumber newNumber: Double?)  // Called when user enters valid new number
    
    // Optional
    func textFieldDidBeginEditing(textField: UITextField)
    func textFieldDidClear(textField: UITextField)
    func textFieldDidReturn(textField: UITextField)
}

public extension NumberTextFieldRelayedDelegate {
    func textFieldDidBeginEditing(textField: UITextField) { }
    func textFieldDidClear(textField: UITextField) { }
    func textFieldDidReturn(textField: UITextField) { }
}


public class NumberTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    public var prefix: String?
    public var suffix: String?
    
    public var maxValue: Double?
    public var maxNumOfIntegerDigits: Int?
    public var maxNumOfDecimalDigits: Int?
    
    
    public weak var relayedDelegate: NumberTextFieldRelayedDelegate?
    
    // MARK: - Initializations
    
    public init(maxNumOfIntegerDigits: Int = 1, maxNumOfDecimalDigits: Int = 0) {
        self.maxNumOfIntegerDigits = maxNumOfIntegerDigits
        self.maxNumOfDecimalDigits = maxNumOfDecimalDigits
    }
    
    public init(prefix: String?, suffix: String?) {
        self.prefix = prefix
        self.suffix = suffix
    }
    
    // MARK: - UITextFieldDelegate
    
    public func textFieldDidBeginEditing(textField: UITextField) {
        relayedDelegate?.textFieldDidBeginEditing(textField)
        updateDisplayedTextOf(textField, whereEndedEditing: false)
    }
    
    public func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text ?? ""
        let newText = (oldText as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        guard !newText.isEmpty else { currentValidNumber = nil; return true }
        
        return isEnteredTextValidNum(newText)
    }
    
    public func textFieldShouldClear(textField: UITextField) -> Bool {
        relayedDelegate?.textFieldDidClear(textField)
        currentValidNumber = nil
        return true
    }
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        relayedDelegate?.textFieldDidReturn(textField)
        textField.resignFirstResponder()
        return true
    }
    
    public func textFieldDidEndEditing(textField: UITextField) {
        relayedDelegate?.textField(textField, didEndEditingWithNumber: currentValidNumber)
        updateDisplayedTextOf(textField, whereEndedEditing: true)
    }
    
    // MARK: - Private
    
    private var currentValidNumber: Double?
    
    private func updateDisplayedTextOf(textField: UITextField, whereEndedEditing didEndEditing: Bool) {
        guard let currentValidNumber = currentValidNumber else { return }
        let numberString = maxNumOfDecimalDigits == 0 ? "\(Int(currentValidNumber))" : "\(currentValidNumber)"
        textField.text = didEndEditing ? (prefix ?? "") + numberString + (suffix ?? "") : numberString
    }
    
    private func isEnteredTextValidNum(input: String) -> Bool {
        guard let newNumber = NSNumberFormatter().numberFromString(input) as? Double else { return false }
        
        let decimalMark = NSNumberFormatter().decimalSeparator
        let components = input.componentsSeparatedByString(decimalMark)
        let numOfIntegerDigits = components.count > 0 ? components[0].length : 0
        let numOfDecimalDigits = components.count > 1 ? components[1].length : 0
        
        if numOfIntegerDigits > maxNumOfIntegerDigits || numOfDecimalDigits > maxNumOfDecimalDigits { return false }
        
        // Disable decimal mark for whole number
        if maxNumOfDecimalDigits == 0 && input.containsString(decimalMark) { return false }
        
        currentValidNumber = newNumber
        
        return true
    }
}
