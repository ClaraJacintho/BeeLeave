//
//  ViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentTripTV: UITableView!
    @IBOutlet weak var tableView: UITableView!
    var tableViewController: PersonsTableViewController!
//    var tripsTableViewController : TripTableViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //let nib = UINib(nibName: "TripItemCell", bundle: nil)
        
     //   tableView.register(nib, forCellReuseIdentifier: "tripItemCell")
        //currentTripTV.register(nib, forCellReuseIdentifier: "tripItemCell")
        
        //self.currentTripTV.rowHeight = 175; //The CELL in all its glory
    
    //TripTableViewController(tableView: self.currentTripTV)
//        self.tableViewController = PersonsTableViewController(tableView: self.tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateAction(_ sender: Any) {
        guard let index = self.tableView.indexPathForSelectedRow else{
            return
        }
        
//        self.tableViewController.personsViewModel.updateBirthDate(atIndexPath: index, withDate: Date())
    }
    
    
    
    // Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        print(":)")
//        if let destController = segue.destination as? TripDetailViewController {
//            if let cell = sender as? TripItemTableViewCell{
//                guard let indexPath = self.currentTripTV.indexPath(for: cell) else{
//                    print(":(")
//                    return
//                }
//                destController.trip = self.tripsTableViewController.tripViewModel.get(tripAt: indexPath.row)
//            }
//        }
//        if let destController = segue.destination as? PersonDetailViewController {
//            if let cell = sender as? UITableViewCell{
//                guard let indexPath = self.tableView.indexPath(for: cell) else{
//                    return
//                }
//                destController.person = self.tableViewController.personsViewModel.get(personAt: indexPath.row)
//            }
//        }
    }


    // segue ViewControllerB -> ViewController
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
//        if let newPersonController = sender.source as? NewPersonViewController {
//            //dataRecieved = sourceViewController.dataPassed
//            if let person = newPersonController.newPerson{
//                //
//                self.tableViewController.personsViewModel.add(person: person)
//            } }
//
        
        if let newTripController = sender.source as? NewTripViewController {
            if let newTrip : Trip = newTripController.newTrip {
//                self.tripsTableViewController.tripViewModel.add(trip: newTrip)
            }
        }
    }


}

