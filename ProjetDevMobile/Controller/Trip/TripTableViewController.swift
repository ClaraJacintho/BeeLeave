//
//  TripTableViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 23/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class TripTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, TripViewModelDelegate {
    var tableView   : UITableView
    var tripViewModel : TripsViewModel
    
    //TODO
    //var trips : PersonTripViewModel = PersonTripSetViewModel(personTripSet: PersonTripSet())
    
    let fetchResultController : TripFetchResultController
    
    init(tableView: UITableView) {
        
        self.tableView  = tableView
        self.fetchResultController = TripFetchResultController(view : tableView)
        self.tripViewModel = TripsViewModel(data: self.fetchResultController.tripsFetched)
        
        
        //self.personTripViewModel = PersonTripViewModel(data: <#T##NSFetchedResultsController<Person>#>)
        
        super.init()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tripViewModel.delegate = self
        
        
    }
    
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
    


    
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 214.5
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.tripViewModel.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tripItemCell", for: indexPath) as? TripItemTableViewCell else { fatalError() }
//        cell.textLabel?.text = ""
        guard let trip = self.tripViewModel.get(tripAt: indexPath.row) else { return cell }
//        cell.textLabel?.text = trip.ttitle
        cell.cityName?.text = trip.ttitle
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        cell.startsDate?.text = formatter.string(from: trip.tripStart)
        cell.endsDate?.text = formatter.string(from: trip.tripEnd)
        let image = UIImage(data: trip.tphoto!)
        if image != nil {
            cell.tripImage?.image = image
        }
        
        cell.nbParticipants?.text = String(trip.person!.count)
        //cell.nextToPay?.text = trip.person.hasExpense.
        
        return cell
    }
    
//    func ttableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        print("hello")
//         guard let cell : TripItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "tripItemCell", for: indexPath) as? TripItemTableViewCell else {
//            print("Cell is not Current Trip Cell")
//            fatalError()
//        }
//         return configure(cell: cell, atIndexPath: indexPath)
//    }
    
    
    
    
 

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
//        guard let trip = self.tripViewModel.get(tripAt: indexPath.row) else { return cell }
            cell.cityName?.text = "hello"
        //        cell.cityName?.text = trip.ttitle
//        cell.startsDate?.text = dateFormatter.string(from: trip.tstart!)
//        cell.endsDate?.text = dateFormatter.string(from: trip.tend!)
//        cell.nbParticipants?.text = "5"
        return cell
    }
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    

}
