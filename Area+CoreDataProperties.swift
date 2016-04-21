//
//  Area+CoreDataProperties.swift
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

extension Area {

    @NSManaged var areaID: NSNumber?
    @NSManaged var areaInfo: String?
    @NSManaged var areaName: String?
    @NSManaged var mapURL: String?
    @NSManaged var beacon: Beacon?
    @NSManaged var user: NSSet?

}
