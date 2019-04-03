//
//  PersonTripSetViewModel.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 29/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol PersonTripViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a Person-Trip relation is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func personTripDeleted(at indexPath: IndexPath)
    /// called when a Person-Trip relation is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func personTripUpdated(at indexPath: IndexPath)
    /// called when a Person-Trip relation is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func personTripAdded(at indexPath: IndexPath)
}

class PersonTripViewModel {
    
    var delegate : PersonTripViewModelDelegate? = nil
    var personsFetched : NSFetchedResultsController<Person>
    //var expensesFetched : NSFetchedResultsController<Expense>
    
    init(data: NSFetchedResultsController<Person>){
        self.personsFetched = data
    }
    
    public func add(tripPerson: Person){
        if let indexPath = self.personsFetched.indexPath(forObject: tripPerson){
            self.delegate?.personTripAdded(at: indexPath)
        }
    }
    
    public var count : Int{
        return self.personsFetched.fetchedObjects?.count ?? 0
    }
    
    public func get(personTripAt index: Int) -> Person?{
        return self.personsFetched.object(at: IndexPath(row: index, section: 0))
    }
    
    public func getAll() -> [Person]?{
        return self.personsFetched.fetchedObjects
        //return self.personsFetched.object(at: IndexPath(row: index, section: 0))
    }

}
