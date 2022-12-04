//
//  Expense+CoreDataProperties.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 09/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double
    @NSManaged public var rawDate: Date?
    @NSManaged public var category: Category?

}
