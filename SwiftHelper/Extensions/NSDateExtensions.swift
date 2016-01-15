//
//  NSDateExtensions.swift
//  SwiftHelper
//
//  Created by Justin on 1/11/16.
//
//

import Foundation

extension NSDate {
    
    private var defaultCalendar: NSCalendar {
        return NSCalendar.currentCalendar()
    }
    
    private var defaultTimeZone: NSTimeZone {
        return NSTimeZone.localTimeZone()
    }
    
    
    public func midnight(timezone: NSTimeZone? = nil) -> NSDate {
        let calendar = defaultCalendar
        calendar.timeZone = timezone ?? defaultTimeZone
        return calendar.startOfDayForDate(self)
    }
    
    public func isToday(timezone: NSTimeZone? = nil) -> Bool {
        return self.midnight(timezone) == NSDate().midnight(timezone)
    }
    
    public func yesterdayMidnight(timezone: NSTimeZone? = nil) -> NSDate {
        return self.midnight(timezone).dateByAddingTimeInterval(-60 * 60 * 24)
    }
    
    public func dateComponents(timezone: NSTimeZone? = nil) -> (year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int) {
        let calendar = defaultCalendar
        calendar.timeZone = timezone ?? defaultTimeZone
        
        let components = calendar.components([.Year, .Month, .Day, .Hour, .Minute, .Second], fromDate: self)
        return (components.year, components.month, components.day, components.hour, components.minute, components.second)
    }
    
    public func numberOfdaysSince(date: NSDate, timezone: NSTimeZone? = nil) -> Int {
        return self.dateComponents(timezone).day - date.dateComponents(timezone).day
    }
}



extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}
