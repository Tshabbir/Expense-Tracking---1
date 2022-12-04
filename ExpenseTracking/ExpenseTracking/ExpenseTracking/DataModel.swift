//
//  DataModel.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 08/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//

import Foundation

class DataModel {
    var title: String?
    var sectionData = [String]()
    var isExpanded: Bool = false
    
    init(title: String, sectionData: [String], isExpanded: Bool) {
        self.title = title
    self.sectionData = sectionData
        self.isExpanded = isExpanded
    }
}
