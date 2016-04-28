//
//  Product+CoreDataProperties.swift
//  Kiasmapp
//
//  Created by iosdev on 28.4.2016.
//  Copyright © 2016 Alex Lindroos. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Product {

    @NSManaged var artist: String?
    @NSManaged var imageURL: String?
    @NSManaged var productID: NSNumber?
    @NSManaged var productInfo: String?
    @NSManaged var productName: String?

}
