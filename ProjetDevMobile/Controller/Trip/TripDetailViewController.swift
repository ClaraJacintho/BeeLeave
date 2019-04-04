//
//  TripDetailViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 25/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {
    @IBOutlet weak var ttitle: UILabel!
    @IBOutlet weak var sdate: UILabel!
    @IBOutlet weak var edate: UILabel!
   
    
    @IBOutlet weak var personTable: UITableView!
    var personController : PersonsTableViewController!
   
    @IBOutlet weak var expensesTable: UITableView!
    var expensesController : ExpensesTableViewController!
    
    @IBOutlet weak var totalCost: UILabel!
    
    
    var trip : Trip?
    var participants : [Person]?
    var personTrip : PersonTrip?
    var totalCostValue : Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Populate person list
        self.personController = PersonsTableViewController(tableView: personTable, trip : self.trip!)
        
        //Populate expenses list
        self.expensesController = ExpensesTableViewController(tableView: expensesTable, trip: self.trip!)
        
        totalCostValue = TripDAO.getSumExpenses(byTrip: self.trip!)
        
        //Update labels
        configLabels()
        
    }
    
    func configLabels() {
        if let atrip = self.trip {
            self.ttitle.text = atrip.ttitle
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            self.sdate.text = formatter.string(from: atrip.tstart!)
            self.edate.text = formatter.string(from: atrip.tend!)
            self.totalCost.text = String(self.totalCostValue)
        } else {
            self.ttitle.text = ""
            self.sdate.text = ""
            self.edate.text = ""
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destController = segue.destination as? NewExpenseViewController {
            destController.trip = self.trip
        }
        
        if let destController = segue.destination as? NewPersonViewController {
            destController.trip = self.trip
        }
        
        if let destController = segue.destination as? PersonDetailViewController {
            if let cell = sender as? UITableViewCell{
                guard let indexPath = self.personTable.indexPath(for: cell) else{
                    return
                }
                    destController.person = self.personController.personViewModel.get(personAt: indexPath.row)
                    destController.totalCost = self.totalCostValue
                    destController.totalParticipants = (self.trip?.person?.count)!
                
                }
        }


    }
    
    @IBAction func unwindToTripDetail(sender: UIStoryboardSegue) {
//        if let newPersonController = sender.source as? NewPersonViewController {
//            if let person : Person = newPersonController.newPerson {
//                print("-------------CHEGOU AQUI1 -----------------")
////                self.personTable.reloadData()
////                do{
////                    try self.personController.fetchResultController.personsFetched.performFetch()
////                }catch{
////                    print("Erro!")
////                }
//
//                //self.personController.personTripViewModel.add(tripPerson: person)
//                self.personController.personViewModel.add(person: person)
//                //self.personTable.reloadData()
//                print("-------------CHEGOU AQUI111 -----------------")
//            }
//        }
    }
    
}
