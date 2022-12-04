//
//  Income+CoreDataProperties.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 09/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension Income {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Income> {
        return NSFetchRequest<Income>(entityName: "Income")
    }

    @NSManaged public var name: Double
    @NSManaged public var amount: NSObject?
    @NSManaged public var rawDate: Date?

}
