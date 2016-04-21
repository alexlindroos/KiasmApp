//
//  Beacon+CoreDataProperties.swift
//  Kiasmapp
//
//  Created by iosdev on 21.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Beacon {

    @NSManaged var beaconID: NSNumber?
    @NSManaged var major: NSNumber?
    @NSManaged var minor: NSNumber?
    @NSManaged var uuid: String?
    @NSManaged var area: Area?

}
