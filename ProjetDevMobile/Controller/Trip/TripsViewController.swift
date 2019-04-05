//
//  DummyViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 26/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var tripController : TripTableViewController!
    
    @IBOutlet weak var nbParticipants: UILabel!
    @IBOutlet weak var nextToPay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tripController = TripTableViewController(tableView: self.tableView)
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destController = segue.destination as? TripDetailViewController {
            if let cell = sender as? UITableViewCell{
                guard let indexPath = self.tableView.indexPath(for: cell) else{
                    return
                }
                    //Coloca variável trip em TripDetailViewController
                guard let trip = self.tripController.tripViewModel.get(tripAt: indexPath.row) else {
                    return
                }
                destController.trip = trip
                }
        }
        
    }
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let newTripController = sender.source as? NewTripViewController {
            if let newTrip : Trip = newTripController.newTrip {
                    self.tripController.tripViewModel.add(trip: newTrip)
            }
        }       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
 
    

}
