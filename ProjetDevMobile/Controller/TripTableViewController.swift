//
//  TripTableViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 23/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class TripTableViewController: NSObject, UITableViewDataSource, TripViewModelDelegate  {
    func dataSetChanged() {
         self.tableView.reloadData()
    }
    
    func tripDeleted(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func tripUpdated(at indexPath: IndexPath) {
         self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func tripAdded(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    

    var tableView   : UITableView
    var tripViewModel : TripsViewModel
    let fetchResultController : TripFetchResultController
    
    init(tableView: UITableView) {
        
        self.tableView        = tableView
       
        self.fetchResultController = TripFetchResultController(view : tableView)
        
        self.tripViewModel = TripsViewModel(data: self.fetchResultController.tripsFetched)
       
        super.init()
        
        
        self.tableView.dataSource      = self
       
        self.tripViewModel.delegate = self
        
        
    }
    
   

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("ahoy")
   
         guard let cell : TripItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tripItemCell", for: indexPath) as? TripItemTableViewCell else {
            print("Cell is not Current Trip Cell")
            fatalError()
        }
         return configure(cell: cell, atIndexPath: indexPath)
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: TripItemTableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
        //guard let trip = self.tripViewModel.get(tripAt: indexPath.row) else { return cell }
        //cell.textLabel?.text = self.presenter.text(ofPerson: person)
        cell.cityName?.text = "Paris"
        cell.startsDate?.text = "23/12/2019"
        cell.endsDate?.text = "01/01/2020"
        cell.nbParticipants?.text = "5"
        return cell
    }

}
