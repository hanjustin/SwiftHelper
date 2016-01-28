//
//  NSDateExtensions.swift
//  SwiftHelper
//
//  Created by Justin on 1/11/16.
//
//

import Foundation

// MARK: - Public

public extension NSDate {
    
    func midnight(timezone: NSTimeZone = .localTimeZone()) -> NSDate {
        let calendar = defaultCalendar
        calendar.timeZone = timezone
        return calendar.startOfDayForDate(self)
    }
    
    func isToday(timezone: NSTimeZone = .localTimeZone()) -> Bool {
        return midnight(timezone) == NSDate().midnight(timezone)
    }
    
    func yesterdayMidnight(timezone: NSTimeZone = .localTimeZone()) -> NSDate {
        return midnight(timezone).dateByAddingTimeInterval(-60 * 60 * 24)
    }
    
    func dateComponent(calendarUnit: NSCalendarUnit, timezone: NSTimeZone = .localTimeZone()) -> Int {
        let calendar = defaultCalendar
        calendar.timeZone = timezone
        return calendar.component(calendarUnit, fromDate: self)
    }
    
    func numberOfdaysSince(date: NSDate, timezone: NSTimeZone = .localTimeZone()) -> Int {
        return dateComponent(.Day, timezone: timezone) - date.dateComponent(.Day, timezone: timezone)
    }
}

// MARK: - Comparable

extension NSDate: Comparable {}

public func ==(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.isEqualToDate(rhs)
}

public func <(lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs) == .OrderedAscending
}


// MARK: - Private

private extension NSDate {
    
    var defaultCalendar: NSCalendar {
        return NSCalendar.currentCalendar()
    }
}