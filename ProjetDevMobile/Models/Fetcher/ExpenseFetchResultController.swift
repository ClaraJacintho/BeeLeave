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
    let trip : Trip
    
    
    init(view : UITableView, trip : Trip){
        self.tableView  = view
        self.trip = trip
        
        super.init()
        do{
            try self.expensesFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        } }
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var expensesFetched : NSFetchedResultsController<Expense> = {
        // prepare a request
        let request : NSFetchRequest<Expense> = Expense.fetchRequest()
        
        request.predicate = NSPredicate(format: "paidBy.hasTrip == %@", self.trip)
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Expense.pcost),ascending:true),NSSortDescriptor(key:#keyPath(Expense.pcost), ascending:true)]
        
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        
        print("Imprimindo count")
        print(fetchResultController.fetchedObjects?.count ?? 0)
        //let personTest : PersonTrip = fetchResultController1.object(at: IndexPath(row: 0, section: 0))
        print("Expenses")
        if ((fetchResultController.fetchedObjects?.count ?? 0) > 0){
            for expense in fetchResultController.fetchedObjects! {
                print(expense.cost)
                print(expense.paidBy?.hasPerson?.fullName)
            }
        }
        
        
        fetchResultController.delegate = self
        
        return fetchResultController
        
//        do{
//            try fetchResultController1.performFetch()
//        }
//        catch let error as NSError{
//            fatalError(error.description)
//        }
//
//        print(fetchResultController1.fetchedObjects?.count ?? 0)
//
//        request.predicate = NSPredicate(format:"SELF in %@", fetchResultController1.fetchedObjects!)
//
//        //        let personTest : PersonTrip = fetchResultController1.object(at: IndexPath(row: 0, section: 0))
//        //        print(personTest.hasPerson?.firstName)
//        //
//        //self.personsFetched.object(at: IndexPath(row: index, section: 0))
//
//
//        //        .fetchedObjects?.count
//        //        print(personsRequest.fetchedObj)
//        //request.
//
//        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Person.plastName),ascending:true),NSSortDescriptor(key:#keyPath(Person.pfirstName), ascending:true)]
//        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
//            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
//        fetchResultController.delegate = self
//
//        return fetchResultController
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
