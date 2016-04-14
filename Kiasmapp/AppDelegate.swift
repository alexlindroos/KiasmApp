//
//  AppDelegate.swift
//  Kiasmapp
//
//  Created by 2 and 1/2 men on 10.4.2016.
//  Copyright © 2016 2 and 1/2 men All rights reserved.
//

import UIKit
// 1. Add the ESTBeaconManagerDelegate protocol
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate {
 
  
    
    var window: UIWindow?
    
   
    // 2. Add a property to hold the beacon manager and instantiate it
    let beaconManager = ESTBeaconManager()
    let timer = TimeManager()
    let date = DateManager()
    var visitTime = 0
    var arriveDate = ""

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // 3. Set the beacon manager's delegate
        self.beaconManager.delegate = self
        
        //4.  request the authorization
        self.beaconManager.requestAlwaysAuthorization()
        
        //5. Start monitoring
        self.beaconManager.startMonitoringForRegion(CLBeaconRegion(
            proximityUUID: NSUUID(UUIDString: "D89ACCA5-F0FD-A90A-29D6-AF6A1E61EF63")!,
            major: 33557, minor: 2842, identifier: "monitored region"))
        
        
        //7. Request to show notifications
        UIApplication.sharedApplication().registerUserNotificationSettings(
            UIUserNotificationSettings(forTypes: .Alert, categories: nil))

        return true
    }
    
    func beaconManager(manager: AnyObject, didEnterRegion region: CLBeaconRegion) {
        print("HELLO YOU HAVE ENTERED THE REGION")
        
       // var arriveDate = date.currentDate()
        
        print("Current date: \(date.currentDate())")
        
        /*timer.startTimer()
        print("This is when it's running \(timer.updateCounter())") */
    }
    
    func beaconManager(manager: AnyObject, didExitRegion region: CLBeaconRegion) {
        print("GOODBYE YOU LEFT THE REGION")
        
        
        
        print("Leave date: \(date.currentDate())")
        
        /*visitTime = timer.stopTimer()
        print("This is when it stopped \( timer.stopTimer())")
        print("User visited this room \(visitTime) seconds")
        print("resetting timer \(timer.resetTimer())")*/
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        //6. add a notification to show up whenever user enters the range of our monitored beacon. TODO: broken
        func beaconManager(manager: AnyObject, didEnterRegion region: CLBeaconRegion) {
            let notification = UILocalNotification()
            notification.alertBody =
                "This is a notifications which appears when" +
                "the user enters to beacons region." +
                "It's shown as a notification because it can be seen in the background" +
            "even when the phone is locked"
            UIApplication.sharedApplication().presentLocalNotificationNow(notification)
        }
    }
    

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

