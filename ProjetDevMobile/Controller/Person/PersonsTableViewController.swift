//
//  PersonTableViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class PersonsTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, PersonSetViewModelDelegate {
    
    func personDeleted(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func personUpdated(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func personAdded(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    //PersonTripViewModelDelegate {
    
    
    var tableView   : UITableView
    //var personTripViewModel : PersonTripViewModel
    var personViewModel : PersonSetViewModel
    //let fetchResultController : PersonTripFetchResultController
    let fetchResultController : PersonFetchResultController
       
    var personSelected : Person?
    
    init(tableView: UITableView, trip : Trip) {
        self.tableView        = tableView
        self.fetchResultController = PersonFetchResultController(view : tableView, trip : trip)
        
        //self.personTripViewModel = PersonTripViewModel(data: self.fetchResultController.personsFetched)
        
       self.personViewModel = PersonSetViewModel(data: self.fetchResultController.personsFetched)
        
        super.init()
        self.tableView.dataSource      = self
        self.tableView.delegate = self
        self.personViewModel.delegate = self
        
        
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //return self.personTripViewModel.count
        return self.personViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCellId", for: indexPath)
        //guard self.personTripViewModel.get(personTripAt: indexPath.row) != nil else { return cell }
        guard self.personViewModel.get(personAt: indexPath.row) != nil else { return cell }
        return configure(cell: cell, atIndexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            //self.personSelected = self.personTripViewModel.get(personTripAt: indexPath.row)
            self.personSelected = self.personViewModel.get(personAt: indexPath.row)
        }
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - PersonSetViewModelDelegate
    /// called when set globally changes
    func dataSetChanged(){
        self.tableView.reloadData()
    }
    /// called when a Person is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func personTripDeleted(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Person is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func personTripUpdated(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Person is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func personTripAdded(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
 //       guard let person = self.personTripViewModel.get(personTripAt: indexPath.row) else { return cell }
       guard let person = self.personViewModel.get(personAt: indexPath.row) else { return cell }
        
        //Show participant full name
        cell.textLabel?.text = person.fullName //+ (person.trip?.ttitle)!
        
        return cell
    }
    
}
