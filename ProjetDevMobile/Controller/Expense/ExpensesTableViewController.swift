//
//  ExpensesTableViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 02/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class ExpensesTableViewController : NSObject, UITableViewDataSource, UITableViewDelegate, ExpenseViewModelDelegate {
    var tableView   : UITableView
    var expenseViewModel : ExpenseViewModel
    let fetchResultController : PersonTripFetchResultController
    
    init(tableView: UITableView, trip : Trip) {
        self.tableView        = tableView
        self.fetchResultController = PersonTripFetchResultController(view : tableView, trip : trip)
        
        self.expenseViewModel = ExpenseViewModel(data: self.fetchResultController.expensesTripFetched)
        
        super.init()
        self.tableView.dataSource      = self
        self.tableView.delegate = self
        self.expenseViewModel.delegate = self
        
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - TableView DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.expenseViewModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "expenseIdCell", for: indexPath)
        guard let expense = self.expenseViewModel.get(expenseAt: indexPath.row) else { return cell }
        
        //Show participant full name
        cell.textLabel?.text = String(expense.cost) + " " + (expense.paidBy?.firstName)!
        return cell
        
        //return configure(cell: cell, atIndexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
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
    func expenseDeleted(at indexPath: IndexPath) {
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Person is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func expenseUpdated(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    /// called when a Person is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func expenseAdded(at indexPath: IndexPath){
        self.tableView.selectRow(at: indexPath, animated: true, scrollPosition: UITableView.ScrollPosition.middle)
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - convenience methods
    @discardableResult
    private func configure(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell{
        guard let expense = self.expenseViewModel.get(expenseAt: indexPath.row) else { return cell }
        
        //Show participant full name
        cell.textLabel?.text = expense.paidBy?.firstName
        
        return cell
    }
    
}
