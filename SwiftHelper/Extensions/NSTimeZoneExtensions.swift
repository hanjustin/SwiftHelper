//
//  NSTimeZoneExtensions.swift
//  SwiftHelper
//
//  Created by Justin on 1/16/16.
//
//

import UIKit
import Foundation

public extension NSTimeZone {
    
    // Used: NSTimeZone.abbreviationDictionary().keys.sort().joinWithSeparator(", ")
    enum TimeZoneAbbreviation: String {
        case ADT, AKDT, AKST, ART, AST, BDT, BRST, BRT, BST, CAT, CDT, CEST, CET, CLST, CLT, COT, CST, EAT, EDT, EEST, EET, EST, GMT, GST, HKT, HST, ICT, IRST, IST, JST, KST, MDT, MSD, MSK, MST, NZDT, NZST, PDT, PET, PHT, PKT, PST, SGT, UTC, WAT, WEST, WET, WIT
    }
    
    /*  Convenience init commented out due to a possible bug.
        There seems to be a bug with initializer extension for NSTimeZone
        self.init() does not seem to initialize NSTimeZone correctly



    convenience init?(abbreviation: TimeZoneAbbreviation) {
        self.init(abbreviation: String(abbreviation))
    }
    */
    
}