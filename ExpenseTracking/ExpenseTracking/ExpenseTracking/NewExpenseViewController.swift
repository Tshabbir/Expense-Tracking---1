//
//  NewExpenseViewController.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 10/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//

import UIKit

class NewExpenseViewController: UIViewController {

  
    @IBOutlet weak var tblNewExpense: UITableView!
    
    @IBOutlet weak var lblName: UILabel!
    
    
    @IBOutlet weak var lblAmount: UILabel!
    
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var txtFieldName: UITextField!
    
    @IBOutlet weak var txtFieldAmount: UITextField!
    
   // @IBOutlet weak var lblCalendar: UITableView!
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtFieldName.resignFirstResponder()
        txtFieldAmount.resignFirstResponder()
    }
    @IBAction func btnAddNewExpense(_ sender: Any) {
        let name = txtFieldName.text
        let amountText = txtFieldAmount.text ?? ""
        let amount = Double(amountText) ?? 0.0
        let date = datePicker.date
        
        if let expense = Expense(name: name, amount: amount, date: date) {
            category?.addToRawExpenses(expense)
            
            do {
                try expense.managedObjectContext?.save()
                
                self.navigationController?.popViewController(animated: true)
            } catch {
                print("Expense could not be created")
            }
        }
        
        
    }
    
}

extension NewExpenseViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    

}
