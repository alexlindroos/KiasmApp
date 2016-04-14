//
//  TimeManager.swift
//  Kiasmapp
//
//  Created by iosdev on 14.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//

import Foundation

class TimeManager: NSTimer{

var counter = 0
var timer = NSTimer()


    func updateCounter() -> Int{
        counter++
        return counter
    }
    
    func startTimer() {
        NSTimer.scheduledTimerWithTimeInterval(1, target:self, selector: #selector(TimeManager.updateCounter), userInfo: nil, repeats: true)
    }
    
    func stopTimer() -> Int {
        timer.invalidate()
        return counter
    }
    
    func resetTimer() -> Int {
        counter = 0
        return counter
    }
    
}