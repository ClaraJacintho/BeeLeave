//
//  ExpenseViewModel.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 03/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol ExpenseViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a expense is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func expenseDeleted(at indexPath: IndexPath)
    /// called when a expense is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func expenseUpdated(at indexPath: IndexPath)
    /// called when a expense is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func expenseAdded(at indexPath: IndexPath)
}

class ExpenseViewModel {
    var delegate : ExpenseViewModelDelegate? = nil
    var expensesFetched : NSFetchedResultsController<Expense>
    var totalCost : Double = 0
   
    init(data: NSFetchedResultsController<Expense>){
        self.expensesFetched = data
        for expenses in self.expensesFetched.fetchedObjects! {
            self.totalCost += expenses.cost
            
        }
    }
    
    public func add(expense: Expense){
        if let indexPath = self.expensesFetched.indexPath(forObject: expense){
            self.delegate?.expenseAdded(at: indexPath)
        }
    }
    
    public var count : Int{
        return self.expensesFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(expenseAt index: Int) -> Expense?{
        return self.expensesFetched.object(at: IndexPath(row: index, section: 0))
    }
    
}
