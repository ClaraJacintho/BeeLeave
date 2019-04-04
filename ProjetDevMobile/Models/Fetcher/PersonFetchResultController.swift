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
    let trip : Trip?
    
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
    }
    //-------------------------------------------------------------------------------------------------
    // MARK: - FetchResultController
    lazy var personsFetched : NSFetchedResultsController<Person> = {
        // prepare a request
        let request : NSFetchRequest<Person> = Person.fetchRequest()
        
        request.predicate = NSPredicate(format: "SELF IN %@", (self.trip?.person!)!)
        
        request.sortDescriptors = [NSSortDescriptor(key:#keyPath(Person.plastName),ascending:true),NSSortDescriptor(key:#keyPath(Person.pfirstName), ascending:true)]
        let fetchResultController = NSFetchedResultsController(fetchRequest: request, managedObjectContext:
            CoreDataManager.context, sectionNameKeyPath: nil, cacheName: nil)
        fetchResultController.delegate = self
                
        return fetchResultController
    }()
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        print("Begin updates!")
        self.tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>){
        print("Endsupdates!")
        self.tableView.endUpdates()
        CoreDataManager.save()
    }
        
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at
        indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        print("Estou no controller!")
        switch type {
        case .update:
            print("Fiz um update")
            if let indexPath = indexPath{
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        case .insert:
            print("Fiz um insert")
            if let newIndexPath = newIndexPath{
                self.tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        case .move :
            print("Fiz um move")
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
}
