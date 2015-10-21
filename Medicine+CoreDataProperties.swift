//
//  Medicine+CoreDataProperties.swift
//  MedTracker
//
//  Created by Justin Ferre on 10/21/15.
//  Copyright © 2015 Justin Ferre. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Medicine {

    @NSManaged var name: String?
    @NSManaged var dosage: String?
    @NSManaged var time: String?

}
