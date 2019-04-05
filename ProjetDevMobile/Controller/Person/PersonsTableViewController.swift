//
//  PersonTableViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class PersonsTableViewController: NSObject, UITableViewDataSource, UITableViewDelegate, PersonSetViewModelDelegate {
    
    var tableView   : UITableView
    var personViewModel : PersonSetViewModel
    let fetchResultController : PersonFetchResultController
       
    var personSelected : Person?
    
    init(tableView: UITableView, trip : Trip) {
        self.tableView        = tableView
        self.fetchResultController = PersonFetchResultController(view : tableView, trip : trip)

       self.personViewModel = PersonSetViewModel(data: self.fetchResultController.personsFetched)
        
        super.init()
        self.tableView.dataSource      = self
        self.tableView.delegate = self
        self.personViewModel.delegate = self
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.personViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCellId", for: indexPath)
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
            self.personSelected = self.personViewModel.get(personAt: indexPath.row)
        }
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - PersonSetViewModelDelegate
    /// called when set globally changes
    func dataSetChanged(){
        self.tableView.reloadData()
    }
    func personDeleted(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func personUpdated(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    
    func personAdded(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
       guard let person = self.personViewModel.get(personAt: indexPath.row) else { return cell }
        
        cell.textLabel?.text = person.fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            guard let person = self.personViewModel.get(personAt: indexPath.row) else { return }
            self.fetchResultController.delete(person: person)
        }
    }
    
}
