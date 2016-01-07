//
//  ItemEntity+CoreDataProperties.swift
//  ToDoListWithCoreData
//
//  Created by Philip Bannon on 07/01/2016.
//  Copyright © 2016 Philip Bannon. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension ItemEntity {

    @NSManaged var title: String?

}
