//
//  Expense+CoreDataClass.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 09/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//
//

import Foundation
import UIKit
import CoreData

@objc(Expense)
public class Expense: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
    
    set {
        rawDate = newValue as NSDate? as Date?
        
    }
}
    convenience init?(name: String?, amount: Double, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as?
            AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext
            
       else {
        return nil
    }

        self.init(entity: Expense.entity(), insertInto: context)

        self.name = name
        self.amount = amount
        self.date = date

}
}
