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
    
    let fetchResultController : TripFetchResultController
    
    init(tableView: UITableView) {
        
        self.tableView  = tableView
        self.fetchResultController = TripFetchResultController(view : tableView)
        self.tripViewModel = TripsViewModel(data: self.fetchResultController.tripsFetched)
        
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
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            guard let trip = self.tripViewModel.get(tripAt: indexPath.row) else { return }
            self.fetchResultController.delete(trip: trip)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "tripItemCell", for: indexPath) as? TripItemTableViewCell else { fatalError() }
        guard let trip = self.tripViewModel.get(tripAt: indexPath.row) else { return cell }
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
        
        guard let nextToPay = PersonTripDAO.getNextToPayByTrip(byTrip: trip) else {
            cell.nextToPay?.text = "No participants"
            return cell
        }
        cell.nextToPay?.text = nextToPay.fullName
        
        return cell
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .none
        return formatter
    }()
    

}
