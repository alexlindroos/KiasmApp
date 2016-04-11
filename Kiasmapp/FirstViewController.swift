//
//  FirstViewController.swift
//  Kiasmapp
//
//  Created by Juhani Lavonen on 10.4.2016.
//  Copyright © 2016 Juhani Lavonen. All rights reserved.
//

import UIKit

// 1. Add the ESTBeaconManagerDelegate protocol
class FirstViewController: UIViewController, ESTBeaconManagerDelegate {
    
    // 2. Add the beacon manager and the beacon region
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")!,
        identifier: "ranged region")

    override func viewDidLoad() {
        super.viewDidLoad()
        // 3. Set the beacon manager's delegate
        self.beaconManager.delegate = self
        // 4. We need to request this authorization for every beacon manager
        self.beaconManager.requestAlwaysAuthorization()
        // Now, the code to start and stop ranging as the view controller appears and disappears on screen.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 5. View will appear
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
    }
    
    // 6. View did disappear
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
    }
    
    // 7. Placeholder data for beacon
    // Add the property holding the data.
    // TODO: replace "<major>:<minor>" strings to match your own beacons
    let placesByBeacons = [
        "33557:2842": [
            "Heavenly Sandwiches": 50, // read as: it's 50 meters from
            // "Heavenly Sandwiches" to the beacon with
            // major 6574 and minor 54631
            "Green & Green Salads": 150,
            "Mini Panini": 325
        ]
    ]
    
    // 8. represent the closest beacon, and return a list of all the places sorted by their distance to it
    func placesNearBeacon(beacon: CLBeacon) -> [String] {
        let beaconKey = "\(beacon.major):\(beacon.minor)"
        if let places = self.placesByBeacons[beaconKey] {
            let sortedPlaces = Array(places).sort { $0.1 < $1.1 }.map { $0.0 }
            return sortedPlaces
        }
        return []
    }
    
    //9. Ranging delegate
    func beaconManager(manager: AnyObject, didRangeBeacons beacons: [CLBeacon],
                       inRegion region: CLBeaconRegion) {
        if let nearestBeacon = beacons.first {
            let places = placesNearBeacon(nearestBeacon)
            // TODO: update the UI here and the tableView
            print(places) // TODO: remove after implementing the UI
            print(nearestBeacon.accuracy)
        }
    }
    
    


    
    



}

