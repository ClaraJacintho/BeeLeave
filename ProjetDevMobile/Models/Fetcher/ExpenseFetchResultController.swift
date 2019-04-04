//
//  ExpenseFetchResultController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 03/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit
import CoreData

class ExpenseFetchResultController: NSObject, NSFetchedResultsControllerDelegate{
    let tableView  : UITableView
    let trip : Trip?
    let person : Person?
    
    
    init(view : UITableView, trip : Trip){
        self.tableView  = view
        self.trip = trip
        self.person = nil
        
        super.init()
        do{
            try self.expensesFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    
    init(view : UITableView, person : Person){
        self.tableView  = view
        self.person = person
        self.trip = nil
        
        super.init()
        do{
            try self.personExpensesFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var expensesFetched : NSFetchedResultsController<Expense> = {
        // prepare a request
        let request : NSFetchRequest<Expense> = Expense.fetchRequest()
        
        request.predicate = NSPredicate(format: "paidBy.hasTrip == %@", self.trip!)
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Expense.pcost),ascending:true),NSSortDescriptor(key:#keyPath(Expense.pcost), ascending:true)]
        
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        
     
        fetchResultController.delegate = self
        
        return fetchResultController
    }()
    
    lazy var personExpensesFetched : NSFetchedResultsController<Expense> = {
        // prepare a request
        let request : NSFetchRequest<Expense> = Expense.fetchRequest()
        
        request.predicate = NSPredicate(format: "paidBy.hasPerson == %@", self.person!)
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Expense.pcost),ascending:true),NSSortDescriptor(key:#keyPath(Expense.pcost), ascending:true)]
        
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        
       
       
        //let personTest : PersonTrip = fetchResultController1.object(at: IndexPath(row: 0, section: 0))

        
        fetchResultController.delegate = self
        
        return fetchResultController
    }()
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        self.tableView.endUpdates()
        CoreDataManager.save()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at
        indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            if let newIndexPath = newIndexPath{
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath{
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        case .update:
            if let indexPath = indexPath{
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            } default:
            break
        }
    }
}
