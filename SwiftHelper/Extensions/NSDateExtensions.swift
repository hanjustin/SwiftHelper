//
//  NSDateExtensions.swift
//  SwiftHelper
//
//  Created by Justin on 1/11/16.
//
//

import Foundation

// TO_DO
// date components (day, month, year, hour)
// numberOfdaysSince(date)

extension NSDate {
    
    public func midnight(timezone: NSTimeZone = NSTimeZone.localTimeZone()) -> NSDate {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        calendar.timeZone = timezone
        return calendar.startOfDayForDate(self)
    }
    
    public func isToday(timezone: NSTimeZone = NSTimeZone.localTimeZone()) -> Bool {
        return self.midnight(timezone) == NSDate().midnight(timezone)
    }
    
}



extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}