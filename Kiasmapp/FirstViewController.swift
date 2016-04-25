//
//  FirstViewController.swift
//  Kiasmapp
//
//  Created by 2 and 1/2 men on 10.4.2016.
//  Copyright © 2016 2 and 1/2 men All rights reserved.
//
import UIKit
import CoreLocation

// 1. Add the ESTBeaconManagerDelegate protocol
class FirstViewController: UIViewController, ESTBeaconManagerDelegate{
    
    
    @IBOutlet weak var beaconIcon: UIImageView!
    @IBOutlet weak var areaMap: UIImageView!
    
    
    @IBOutlet weak var infoButton: UIButton!
    
    var hasVisitedArea: Bool = false
    
    
    // 2. Add the beacon manager and the beacon region
    let beaconManager = ESTBeaconManager()
    let beaconRegion = CLBeaconRegion(
        proximityUUID: NSUUID(UUIDString: "D89ACCA5-F0FD-A90A-29D6-AF6A1E61EF63")!,
        identifier: "ranged region")
   
    let networkOperator = NetworkOperator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 3. Set the beacon manager's delegate
        self.beaconManager.delegate = self
     
        // 4. We need to request this authorization for every beacon manager
        self.beaconManager.requestAlwaysAuthorization()
        
        networkOperator.getAreaData()
        print("Area data fetched.")
        
        networkOperator.getProductData()
        print("Product data fetched")
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 5. View will appear
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.beaconManager.startRangingBeaconsInRegion(self.beaconRegion)
        self.beaconManager.startMonitoringForRegion(self.beaconRegion)
    }
    
    // 6. View did disappear
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.beaconManager.stopRangingBeaconsInRegion(self.beaconRegion)
        self.beaconManager.stopMonitoringForRegion(self.beaconRegion)
    }
    
    // 7. Placeholder data for beacon
    let placesByBeacons = [
        "33557:2842": [
            "first": 50, // read as: it's 50 meters from
            "second": 325
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
        print("This many beacons in region: \(beacons.count)")
        if let nearestBeacon = beacons.first {
            let places = placesNearBeacon(nearestBeacon)
        
            print(places)
            print(nearestBeacon.accuracy)
            
            if(nearestBeacon.accuracy < 3 && nearestBeacon.accuracy > -1){
                
                
                if hasVisitedArea == false {
                    beaconIcon.image = UIImage(named:"info")
                    //TODO: should turn into true only when user has visited the info view and it should stay that way
                    hasVisitedArea = true
                }
                else if hasVisitedArea == true {
                    beaconIcon.image = UIImage(named: "visited")
                }
                
                infoButton.hidden = false
            }
        }
        

            }
        }
        
     
    
    



    
   
    
    


