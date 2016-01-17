//
//  UIColorExtensions.swift
//  SwiftHelper
//
//  Created by Justin on 1/12/16.
//
//

import Foundation
import UIKit

// MARK: - Private

private extension UIColor {
    
    enum ColorComponent {
        case Red, Green, Blue
        case Alpha
    }
    
    func getColorComponent(component: ColorComponent) -> CGFloat {
        var componentValue: CGFloat = 0
        
        switch component {
            case .Red:
                getRed(&componentValue, green: nil, blue: nil, alpha: nil)
            case .Green:
                getRed(nil, green: &componentValue, blue: nil, alpha: nil)
            case .Blue:
                getRed(nil, green: nil, blue: &componentValue, alpha: nil)
            case .Alpha:
                getRed(nil, green: nil, blue: nil, alpha: &componentValue)
        }
        
        return componentValue
    }
}

// MARK: - Public

public extension UIColor {
    
    var red: CGFloat {
        return getColorComponent(.Red)
    }
    
    var green: CGFloat {
        return getColorComponent(.Green)
    }
    
    var blue: CGFloat {
        return getColorComponent(.Blue)
    }
    
    var alpha: CGFloat {
        return getColorComponent(.Alpha)
    }
    
    
    static func randomColor() -> UIColor {
        let red = Int.randomNum(min: 0, max: 255)
        let green = Int.randomNum(min: 0, max: 255)
        let blue = Int.randomNum(min: 0, max: 255)
        
        return UIColor(r: red, g: green, b: blue)
    }
    
    convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
}