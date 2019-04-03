//
//  PersonTripFetchResultController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 29/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit
import CoreData

class PersonTripFetchResultController: NSObject, NSFetchedResultsControllerDelegate {
    let tableView  : UITableView
    let trip : Trip
    
    init(view : UITableView, trip : Trip){
        self.tableView  = view
        self.trip = trip
        
        super.init()
        do{
            try self.personsTripFetched.performFetch()
            //try self.expensesTripFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var personsTripFetched : NSFetchedResultsController<Person> = {
        // prepare a request
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        
        let personsRequest : NSFetchRequest<PersonTrip> = PersonTrip.fetchRequest()
        
        personsRequest.predicate = NSPredicate(format: "hasTrip == %@", self.trip)
        
        personsRequest.sortDescriptors = [NSSortDescriptor(key:#keyPath(PersonTrip.hasPerson),ascending:true),NSSortDescriptor(key:#keyPath(PersonTrip.hasPerson), ascending:true)]
        
        let fetchResultController1 = NSFetchedResultsController(fetchRequest: personsRequest, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        
        fetchResultController1.delegate = self
        
        do{
            try fetchResultController1.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        
        //print(fetchResultController1.fetchedObjects)
            
        
        request.predicate = NSPredicate(format:"SELF in %@", fetchResultController1.fetchedObjects!)
        

        
        
//
        //self.personsFetched.object(at: IndexPath(row: index, section: 0))
            
            
//        .fetchedObjects?.count
//        print(personsRequest.fetchedObj)
        //request.
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Person.plastName),ascending:true),NSSortDescriptor(key:#keyPath(Person.pfirstName), ascending:true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        
        return fetchResultController
    }()
    
    // MARK: - FetchResultController
/*
    lazy var expensesTripFetched : NSFetchedResultsController<Expense> = {
        
        let expenseRequest : NSFetchRequest<Expense> = Expense.fetchRequest()
        
        // prepare a request
        let personsRequest : NSFetchRequest<PersonTrip> = PersonTrip.fetchRequest()
        
        // query
        personsRequest.predicate = NSPredicate(format: "hasTrip == %@", self.trip)
        
        personsRequest.sortDescriptors = [NSSortDescriptor(key:#keyPath(PersonTrip.hasExpense),ascending:true),NSSortDescriptor(key:#keyPath(PersonTrip.hasExpense), ascending:true)]
        
        let personTripFRC = NSFetchedResultsController(fetchRequest: personsRequest, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        
        personTripFRC.delegate = self
        
        do{
            try personTripFRC.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        
        print("Imprimindo count")
        print(personTripFRC.fetchedObjects?.count ?? 0)
        //let personTest : PersonTrip = fetchResultController1.object(at: IndexPath(row: 0, section: 0))
        print("Trips")
        for personTrip in personTripFRC.fetchedObjects! {
            print(personTrip.hasTrip?.tripTitle)
        }
        
        print("Persons")
        for personTrip in personTripFRC.fetchedObjects! {
            print(personTrip.hasPerson?.fullName)
        }
        
        print("Expenses")
        for personTrip in personTripFRC.fetchedObjects! {
//            for expense in personTrip.hasExpense! {
//                print(expense.cost)
//            }
            print(personTrip.hasExpense!.count)
        }
        
        
//        print(personTest.hasTrip?.tripTitle)
//        print("QUEM PAGOU?!")
//        print(personTest.hasExpense?.paidBy)
//
        expenseRequest.predicate = NSPredicate(format:"SELF in %@", personTripFRC.fetchedObjects!)
        
        //        let personTest : PersonTrip = fetchResultController1.object(at: IndexPath(row: 0, section: 0))
        //        print(personTest.hasPerson?.firstName)
        //
        //self.personsFetched.object(at: IndexPath(row: index, section: 0))
        
        
        //        .fetchedObjects?.count
        //        print(personsRequest.fetchedObj)
        //request.
        
        expenseRequest.sortDescriptors = [NSSortDescriptor(key:#keyPath(Expense.pcost),ascending:true),NSSortDescriptor(key:#keyPath(Expense.pcost), ascending:true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: expenseRequest, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
        
        return fetchResultController
    }()
    
    */
    
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
