//
//  NSDateExtensions.swift
//  SwiftHelper
//
//  Created by Justin on 1/11/16.
//
//

import Foundation

// MARK: - Private

extension NSDate {
    
    private var defaultCalendar: NSCalendar {
        return NSCalendar.currentCalendar()
    }
}

// MARK: - Public methods

extension NSDate {
    
    public func midnight(timezone: NSTimeZone = .localTimeZone()) -> NSDate {
        let calendar = defaultCalendar
        calendar.timeZone = timezone
        return calendar.startOfDayForDate(self)
    }
    
    public func isToday(timezone: NSTimeZone = .localTimeZone()) -> Bool {
        return self.midnight(timezone) == NSDate().midnight(timezone)
    }
    
    public func yesterdayMidnight(timezone: NSTimeZone = .localTimeZone()) -> NSDate {
        return self.midnight(timezone).dateByAddingTimeInterval(-60 * 60 * 24)
    }
    
    public func dateComponent(calendarUnit: NSCalendarUnit, timezone: NSTimeZone = .localTimeZone()) -> Int {
        let calendar = defaultCalendar
        calendar.timeZone = timezone
        return calendar.component(calendarUnit, fromDate: self)
    }
    
    public func numberOfdaysSince(date: NSDate, timezone: NSTimeZone = .localTimeZone()) -> Int {
        return self.dateComponent(.Day, timezone: timezone) - date.dateComponent(.Day, timezone: timezone)
    }
}


extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}

