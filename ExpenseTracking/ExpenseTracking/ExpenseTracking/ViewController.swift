//
//  ViewController.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 06/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//

import UIKit

/*
struct cellData {
    var opened = Bool()
    var title = String()
    var  sectionData = [String]()
    
}
 */

class ViewController: UIViewController { //, UITableViewDataSource, UITableViewDelegate {
//{
    var isExpafanded   = Bool()
   @IBOutlet weak var tblExpenses: UITableView!
   
var data = [DataModel(title: "Income", sectionData:   ["Cell1","Cell2","Cell3"], isExpanded: false),
            DataModel(title: "Food", sectionData: ["Cell1","Cell2","Cell3"], isExpanded:  false),
            DataModel(title: "Utility", sectionData: ["Cell1","Cell2","Cell3"], isExpanded: false),
            DataModel(title: "Fuel", sectionData: ["Cell1","Cell2","Cell3"], isExpanded: false)]
                         
    
   // var tblViewData = [cellData]()
    
   // func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return 10
   // }
    
   // func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  let cell = tblExpenses.dequeueReusableCell(withIdentifier: "cells")
       // cell?.textLabel?.text = "Sample"
       // return cell!
        
   // }
//}
    
    //@IBOutlet weak var tblExpenses: UITableView!
    override func viewDidLoad() {
    super.viewDidLoad()
    
        //tableView.delegate = self
        //tableView.dataSource = self
        // Do any additional setup after loading the view.
 /*
        tblViewData = [cellData(opened: false, title: "Income", sectionData: ["Cell1","Cell2","Cell3"]),
                cellData(opened: false, title: "Food", sectionData: ["Cell1","Cell2","Cell3"]),
                cellData(opened: false, title: "Utility", sectionData: ["Cell1","Cell2","Cell3"]),
            */   // cellData(opened: false, title: "Fuel", sectionData: ["Cell1","Cell2","Cell3"])]
                                 
    }

override func didReceiveMemoryWarning() {
   super.didReceiveMemoryWarning()
    }

/*func numberOfSections(in tableView: UITableView) -> Int {
        return tblViewData.count
    }
   // override func numberOfSections(in tblExpenses: UITableView) -> Int{
   // return tblViewData.count
   // }
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
//func tblExpenses(_ tblExpenses: UITableView, numberOfRowsInSection section: Int) -> Int{
    if tblViewData[section].opened == true {
         return tblViewData[section].sectionData.count + 1
    } else {
        return 1
    }
    }
//}
    //func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      //  return 10
   // }
    
//func tblExpenses(_ tblExpenses: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    if indexPath.row == 0 {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
            else {
             
                return UITableViewCell()
    }
    cell.textLabel?.text = tblViewData[indexPath.section].title
        return cell
    } else {
        // Use different cell identifier if needed
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        else {
        return UITableViewCell()
            
        }
        cell.textLabel?.text = tblViewData[indexPath.section].sectionData[indexPath.row - 1]
        //}
    return cell
        
    }
    }
     */
//func tblExpenses(_ tblExpenses: UITableView, didSelectRowAt indexPath: IndexPath) {
/*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    if data[indexPath.section].isExpanded == true {
            data[indexPath.section].isExpanded = false
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            //tblExpenses.reloadSections(sections, with: .none)
        } else {
        data[indexPath.section].isExpanded = true
            let sections = IndexSet.init(integer: indexPath.section)
            tableView.reloadSections(sections, with: .none)
            
        }
    }

//}
*/



// let cell = tblExpenses.dequeueReusableCell(withIdentifier: "cells")
   // cell?.textLabel?.text = "Sample"
   // return cell!
        
   // }

//}
//}
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
   // func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    //}
    
    //func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
  //  }
    
 
func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
//}
    //override func tblExpenses(_ tblExpenses: UITableView, viewForHeaderInSection section: Int) //-> UIView?  {
  let title = HeaderView(frame: CGRect(x: 0, y: 0, width:
    tblExpenses.frame.size.width, height: 40))
    title.delegate = self as HeaderDelegate
     title.secIndex = section
    title.btn.setTitle(data[section].title, for: .normal)
     return title
    
    }
   func numberOfSections(in tableView: UITableView) -> Int {
    return 3
   // func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
   // return 7
}
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if data[section].isExpanded {
           
            return data[section].sectionData.count
        } else {
            
            return 0
        }
    
    }
//}
// override func numberOfRowsInSections(in tblExpenses: UITableView) -> Int {
   // return 7

//}
//override func tblExpenses(tblExpenses: UITableView, numberOfRowsInSection section: Int) -> Int {
       //return 10
   //}
   // func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       // return 40
//}

  //  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> CGFloat{
//override func tblExpenses(_ tblExpenses: UITableView, heightForHeaderInSectionsection: Int) //-> CGFloat{
          //  return 40
        //}
//override func tblExpenses(_ tblExpenses: UITableView, numRowsInSection section: Int) -> Int {
           // return 5
       // }
//}

//}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
  let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row].sectionData[indexPath.row] 
        
       // let cell = tblExpenses.dequeueReusableCell(withIdentifier: "cell")
              // cell?.textLabel?.text = "Sample"
                return cell!
                

        
        //return cell!
  
}
    }

extension ViewController: HeaderDelegate {
    func callHeader(index: Int) {
        data[index].isExpanded = !data[index].isExpanded
        tblExpenses.reloadSections([index], with: .automatic)
}
}
    /*
   func tblExpenses(_ tblExpenses: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tblExpenses.dequeueReusableCell(withIdentifier: "cells")
            cell?.textLabel?.text = "Sample"
            return cell!
            
        }
    //}
//}

*/


