//
//  PersonFetchResultController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 22/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit
import CoreData
class PersonFetchResultController: NSObject, NSFetchedResultsControllerDelegate{
    var tableView  : UITableView
    let trip : Trip
    
    init(view : UITableView, trip : Trip){
        self.tableView  = view
        self.trip = trip
        super.init()
        do{
            try self.personsFetched.performFetch()
        }
        catch let error as NSError{
            fatalError(error.description)
        }
        //tableView.reloadData()
    }
    
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var personsFetched : NSFetchedResultsController<Person> = {
        // prepare a request
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        
        //request.predicate = NSPredicate(format: "SELF IN %@", (self.trip.person!))
        //request.predicate = NSPredicate(format: "trip.hasTrip.ttitle contains[c] %@", self.trip.ttitle!)
        request.predicate = NSPredicate(format: "ANY trip.hasTrip == %@", self.trip)
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Person.plastName),ascending:true),NSSortDescriptor(key:#keyPath(Person.pfirstName), ascending:true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
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
            
        case .update:
            if let indexPath = indexPath{
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        case .insert:
            if let newIndexPath = newIndexPath{
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .move :
            if let indexPath = indexPath{
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        case .delete:
            if let indexPath = indexPath{
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        default:
            break
        
        }
    }
    
    func delete(person: Person){
        CoreDataManager.context.delete(person)
    }
}
