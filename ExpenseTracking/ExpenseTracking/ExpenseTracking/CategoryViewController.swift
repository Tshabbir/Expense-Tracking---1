//
//  CategoryViewController.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 09/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UIViewController {

    @IBOutlet weak var tblCategory: UITableView!
    
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
            else {
                
                return 
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        
        
        do {
             categories = try managedContext.fetch(fetchRequest)
            
            tblCategory.reloadData()
       
        } catch { print("Could not fetch")
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ExpensesViewController,
          let selectedRow = self.tblCategory.indexPathForSelectedRow?.row else {
                return
            }
        
        destination.category = categories[selectedRow]
        }
    
    func deleteCategory(at indexPath: IndexPath) {
        let category = categories[indexPath.row]
        
        guard let managedContext = category.managedObjectContext else {
            return
        }
        
        managedContext.delete(category)
        
        do {
            try managedContext.save()
            
            categories.remove(at: indexPath.row)
            
            tblCategory.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete")
            
            tblCategory.reloadRows(at: [indexPath], with: .automatic)
        }
    }
}

    extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tblCategory.dequeueReusableCell(withIdentifier: "categoryCell",  for: indexPath)
    let category = categories[indexPath.row]
    
    cell.textLabel?.text = category.title
        return cell
       }

    //@IBAction func btnAdd(_ sender: Any) {
    //}
        
        func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
        deleteCategory(at: indexPath)
        
    }
            
        }

 @IBAction func btnAdd(_ sender: Any) {
    
    performSegue(withIdentifier: "showExpense", sender: self)

}
}

//extension ExpensesViewController: UITableViewDataSource {
//func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
   // <#code#>
//}
       // }
    
    
    



