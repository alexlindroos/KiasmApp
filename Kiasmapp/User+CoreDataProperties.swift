//
//  User+CoreDataProperties.swift
//  Kiasmapp
//
//  Created by Juhani Lavonen on 11.4.2016.
//  Copyright © 2016 Juhani Lavonen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var userID: NSNumber?
    @NSManaged var name: String?
    @NSManaged var password: String?
    @NSManaged var area: NSSet?

}