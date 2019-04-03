//
//  NewExpenseViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 02/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class NewExpenseViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var personExpensesTable : PersonsTableViewController!
    var trip : Trip?
    
    @IBOutlet weak var costValue: UITextField!
    
    var expense : Expense?
    
    var personTrip : PersonTrip?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        costValue.delegate = self
        
        self.personExpensesTable = PersonsTableViewController(tableView: tableView, trip : self.trip!)
        
        //self.expensesTable = ExpensesTableViewController()
        //self.tableView = personTable
        //self.tableView.allowsMultipleSelection = true
        // Do any additional setup after loading the view.
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard CharacterSet(charactersIn: "0123456789.").isSuperset(of: CharacterSet(charactersIn: string)) else {
            return false
        }
        return true
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "okNewExpense" {
            
            let cost : Double = Double(self.costValue.text!)!
            
            
            let whoPaid : Person = self.personExpensesTable.personSelected!

            self.personTrip = PersonTrip.search(forPerson: whoPaid, trip: self.trip!)
            
            //self.personTrip?.addExpense(person: whoPaid, cost: cost)
            //print(self.personTrip?.hasPerson?.firstName)
            
            self.expense = Expense(paidBy: whoPaid, cost: cost, tripData: personTrip!)
            
            personTrip?.addExpense(expense: self.expense!)
            
            //self.newTrip = Trip(title: title, start: start, end: end, photo: imgData as NSData)
        }
        else{
            self.personTrip = nil
        }
    }
 

}
