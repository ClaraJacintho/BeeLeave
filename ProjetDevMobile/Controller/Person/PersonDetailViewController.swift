//
//  PersonDetailViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 22/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    //@IBOutlet var presenter: PersonPresenter!
    //    @IBOutlet var presenter: PersonPresenter!
    var person : Person?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    var expensesController : ExpensesTableViewController!
    
    @IBOutlet weak var arrivalDateLabel: UILabel!
    
    var totalCost : Double = 0.0
    var totalParticipants : Int = 0
    @IBOutlet weak var balance: UILabel!
    @IBOutlet weak var totalPaidFor: UILabel!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Populate expenses list
        self.expensesController = ExpensesTableViewController(tableView: tableView, person: self.person!)
        
        
        if let aperson = self.person{
  
            self.nameLabel.text = aperson.fullName
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            
            self.arrivalDateLabel.text = formatter.string(from: aperson.arrivalDate ?? Date())
            
            let paidFor : Double = self.expensesController.expenseViewModel.totalCost
            self.totalPaidFor.text = String(paidFor)
            
         
            var bal : Double = 0
            var owed : Double = 0
            var owes : Double = 0
            let doubleTotParticipants = Double(self.totalParticipants)
            
            if(doubleTotParticipants <= 1){ // in theory its is always at least 1
                bal =  paidFor
            }else{
                owed = (paidFor/(doubleTotParticipants)) * (doubleTotParticipants-1)
                owes = (self.totalCost - paidFor)/(doubleTotParticipants)
                bal =  owed - owes
            }
            
            
            
            self.balance?.text = String(bal)
            
            //self.lastnameLabel.resize
            //self.presenter.birthDate(ofPerson: aperson)
            
        } else{
            self.nameLabel.text = ""
            self.arrivalDateLabel.text = ""
           
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
