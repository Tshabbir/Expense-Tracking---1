//
//  Category+CoreDataClass.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 09/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//
//
import UIKit
import Foundation
import CoreData

@objc(Category)
public class Category: NSManagedObject {
    var expenses: [Expense]? {
        return self.rawExpenses?.array as? [Expense]
    }
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        guard let context = appDelegate?.persistentContainer.viewContext
            else{
                return nil
        }
        
        self.init(entity: Category.entity(), insertInto: context)
        
        self.title = title 
        
    }
}
 
