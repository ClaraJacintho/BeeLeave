//
//  ExpenseDAO.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 02/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import CoreData

class ExpenseDAO : CoreDataManager {
    /// Get an array of expenses objects from the table
    ///
    /// - Returns: an array of route objects
    func list() -> [Expense]? {
        
        var results: [Expense]?
        
        do {
            let request: NSFetchRequest<Expense> = Expense.fetchRequest()
            request.returnsObjectsAsFaults = false
            
            try results = CoreDataManager.context.fetch(request)
        } catch let error as NSError {
            NSLog("Unresolved error in fetch \(error), \(error.userInfo)")
        }
        
        return results
        
    }
    
}
