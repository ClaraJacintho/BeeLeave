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
   
    var trip : Trip?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Populate person list
        self.personController = PersonsTableViewController(tableView: personTable, trip : self.trip!)
        
        
        if let atrip = self.trip{
            self.ttitle.text = atrip.ttitle
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            self.sdate.text = formatter.string(from: atrip.tstart!)
            self.edate.text = formatter.string(from: atrip.tend!)
       
            
        } else{
            self.ttitle.text = "Mistakes were made"
            self.sdate.text = ""
            self.edate.text = ""
            
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destController = segue.destination as? NewPersonViewController {
            destController.trip = self.trip
            print("Sabe que estou indo")
        }
        
        if let destController = segue.destination as? PersonDetailViewController {
            if let cell = sender as? UITableViewCell{
                guard let indexPath = self.personTable.indexPath(for: cell) else{
                    return
                }
                    destController.person = self.personController.personTripViewModel.get(personTripAt: indexPath.row)
                }
        }
    }
    
    //Methodo que retorna de NewPersonViewController adicionando uma pessoa a viagem
    @IBAction func unwindToTripDetail(sender: UIStoryboardSegue) {
        if let newPersonController = sender.source as? NewPersonViewController {
            print("Volando1")
            if let person : Person = newPersonController.newPerson {
                print("Volando2")
                self.personController.personTripViewModel.add(tripPerson: person)
            }
        }
    }
    
}