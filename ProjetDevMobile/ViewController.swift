//
//  ViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var tableViewController: PersonsTableViewController!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewController = PersonsTableViewController(tableView: self.tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    @IBAction func addAction(_ sender: Any) {
        let cf: Person
        let df = DateFormatter()
        df.dateFormat = "dd-mm-yyyy"
        if let bdate = df.date(from: "01-06-1988"){
            cf = Person(firstName: "Christophe", lastName: "Fiorio")
        }
        else{
            cf = Person(firstName: "Christophe", lastName: "Fiorio")
        }
        self.tableViewController.personsViewModel.add(person: cf)
        //self.tableView.reloadData()
    }
    
    @IBAction func updateAction(_ sender: Any) {
        guard let index = self.tableView.indexPathForSelectedRow else{
            return
        }
        self.tableViewController.personsViewModel.updateBirthDate(atIndexPath: index, withDate: Date())
    }
    
    
    
    // Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destController = segue.destination as? PersonDetailViewController {
            if let cell = sender as? UITableViewCell{
                guard let indexPath = self.tableView.indexPath(for: cell) else{
                    return
                }
                destController.person = self.tableViewController.personsViewModel.get(personAt: indexPath.row)
            }
        }
    }
    
    // segue ViewControllerB -> ViewController
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let newPersonController = sender.source as? NewPersonViewController {
            //dataRecieved = sourceViewController.dataPassed
            if let person = newPersonController.newPerson{
                //
                self.tableViewController.personsViewModel.add(person: person)
            } }
    }


}

