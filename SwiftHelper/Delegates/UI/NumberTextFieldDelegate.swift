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
        let oldInput = textField.text ?? ""
        let newInput = (oldInput as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        guard !newInput.isEmpty else { currentValidNumber = nil; return true }
        
        guard let newNumber = NSNumberFormatter().numberFromString(newInput) as? Double
            where checkEnteredNumIsValid(newNumber) else { return false }

        currentValidNumber = newNumber

        return true
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
    
    private func checkEnteredNumIsValid(input: Double) -> Bool {
        guard maxNumOfIntegerDigits != nil && maxNumOfDecimalDigits != nil else { return true }
        
        let integerPart = Int(input)
        let numOfIntegerDigits = integerPart.numOfDigits
        let numOfDecimalDigits = Double(integerPart) == input ? 0 : String(input).characters.count - 1 - numOfIntegerDigits
        
        if let maxNumOfIntegerDigits = maxNumOfIntegerDigits where numOfIntegerDigits > maxNumOfIntegerDigits { return false }
        if let maxNumOfDecimalDigits = maxNumOfDecimalDigits where numOfDecimalDigits > maxNumOfDecimalDigits { return false }
        
        return true
    }
}
