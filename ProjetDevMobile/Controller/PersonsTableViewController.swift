//
//  PersonTableViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit
import CoreData

class PersonsTableViewController: NSObject, UITableViewDataSource, PersonSetViewModelDelegate {
    //var presenter   : PersonPresenter
    var tableView   : UITableView
    var personsViewModel : PersonSetViewModel
    let fetchResultController : PersonFetchResultController
    
    init(tableView: UITableView) {
//        self.tableView        = tableView
//        //self.presenter        = PersonPresenter()
//        self.personsViewModel = PersonSetViewModel()
//        super.init()
//        self.tableView.dataSource      = self
//        self.personsViewModel.delegate = self
        self.tableView        = tableView
        //self.presenter        = PersonPresenter()
        self.fetchResultController = PersonFetchResultController(view : tableView)
        self.personsViewModel = PersonSetViewModel(data: self.fetchResultController.personsFetched)
//        self.personsViewModel = PersonSetViewModel(view : tableView)//, model : self.personsViewModel)
//        self.fetchResultController = PersonFetchResultController(view : tableView, model : self.personsViewModel)
        super.init()
        self.tableView.dataSource      = self
        self.personsViewModel.delegate = self
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.personsViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCellId", for: indexPath)
     
//        guard let cell : TripItemTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "CurrentTripId") as? TripItemTableViewCell else {
//            //os_log("error", log: .default, type: .debug)
//            fatalError()
//        }
//        cell.cityName?.text = "Exemplos"
//        cell.nbParticipants?.text = "10"
        
        // Configure the cell...
        return configure(cell: cell, atIndexPath: indexPath)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - PersonSetViewModelDelegate
    /// called when set globally changes
    func dataSetChanged(){
        self.tableView.reloadData()
    }
    /// called when a Person is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func personUpdated(at indexPath: IndexPath){
//        self.tableView.beginUpdates()
//        self.tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.fade)
//        self.tableView.endUpdates()
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Person is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func personAdded(at indexPath: IndexPath){
//        self.tableView.beginUpdates()
//        self.tableView.insertRows(at: [indexPath], with: UITableView.RowAnimation.middle)
//        self.tableView.endUpdates()
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Person is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func personDeleted(at indexPath: IndexPath) {
//        self.tableView.beginUpdates()
//        self.tableView.deleteRows(at: [indexPath], with: .automatic)
//        self.tableView.endUpdates()
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
        guard let person = self.personsViewModel.get(personAt: indexPath.row) else { return cell }
        //cell.textLabel?.text = self.presenter.text(ofPerson: person)
        cell.textLabel?.text = person.fullName
        return cell
    }
    
}
