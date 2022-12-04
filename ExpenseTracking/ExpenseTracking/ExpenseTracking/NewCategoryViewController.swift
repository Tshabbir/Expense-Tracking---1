//
//  NewCategoryViewController.swift
//  ExpenseTracking
//
//  Created by Tausifa Saeed Khan on 10/07/2020.
//  Copyright © 2020 Tausifa Saeed Khan. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    
   
    @IBOutlet weak var txtFieldTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtFieldTitle.delegate = (self as! UITextFieldDelegate)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        txtFieldTitle.resignFirstResponder()
    }
    
    @IBAction func btnSaveCategory(_ sender: Any) {
        let category = Category(title: txtFieldTitle.text ?? "")
        
        do {
            try category?.managedObjectContext?.save()
            self.navigationController?.popViewController(animated: true)
       
        } catch {
            print("Could not save category")
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

}
