//
//  ExpensesViewController.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 10/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//

import UIKit 

class ExpensesViewController: UIViewController {

    
    @IBOutlet weak var tblEpenses: UITableView!
    
    let dateFormatter = DateFormatter()
    
    var category: Category? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        dateFormatter.timeStyle = .long
        dateFormatter.dateStyle = .long
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tblEpenses.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnAddExpenses(_ sender: Any) {
      performSegue(withIdentifier: "showExpense", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? NewExpenseViewController else {
            return
        }
        
        destination.category = category
    }
    
    func deleteExpense(at indexPath: IndexPath) {
        guard let expense = category?.expenses?[indexPath.row],
            let managedContext = expense.managedObjectContext else {
                return
        }
        
        managedContext.delete(expense)
        
        do {
            try managedContext.save()
            tblEpenses.deleteRows(at: [indexPath], with: .automatic)
        } catch {
            print("Could not delete Expense")
            
            tblEpenses.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
}

extension ExpensesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.expenses?.count ?? 0
    }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
{
    let cell  = tblEpenses.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath)
    
    if let expense = category?.expenses?[indexPath.row] {
        cell.textLabel?.text = expense.name
        
        if let date = expense.date {
            cell.detailTextLabel?.text = dateFormatter.string(from: date)
        
    }
    }
    
    return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteExpense(at: indexPath)
            
        }
    }
    
}
    extension ExpensesViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            performSegue(withIdentifier: "showExpense", sender: self)
        }
    
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
//}
//}





