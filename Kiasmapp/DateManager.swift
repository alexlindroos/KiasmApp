//
//  DateManager.swift
//  Kiasmapp
//
//  Created by iosdev on 14.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//

import Foundation

class DateManager: NSDate{
   
    func currentDate() -> String {
     return String(NSDate())
    }
    
    func arriveDate() -> NSDate {
        return NSDate()
    }
    
    func leaveDate() -> NSDate {
        return NSDate()
    }

    override func timeIntervalSinceDate(anotherDate: NSDate) -> NSTimeInterval{
        return Double(NSTimeInterval())
    }
    
}

