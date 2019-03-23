//
//  PersonSetViewModel.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol PersonSetViewModelDelegate {
    // MARK: -
    /// called when set globally changes
    func dataSetChanged()
    /// called when a Person is deleted from set
    ///
    /// - Parameter indexPath: (section,row) of deletion
    func personDeleted(at indexPath: IndexPath)
    /// called when a Person is updated in set
    ///
    /// - Parameter indexPath: (section, row) of updating
    func personUpdated(at indexPath: IndexPath)
    /// called when a Person is added to set
    ///
    /// - Parameter indexPath: (section,row) of add
    func personAdded(at indexPath: IndexPath)
}
//----------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------------------------------------------------
// MARK: -
class PersonSetViewModel{
    // MARK: -
    
//    private let modelset : PersonSet
//    var dataset : [Person] = []
    
    var delegate : PersonSetViewModelDelegate? = nil
    var personsFetched : NSFetchedResultsController<Person>
    
//    init() {
//        guard let appDelegate = UIApplication.shared.delegate  else{
//            fatalError()
//        }
//        self.modelset = (appDelegate as! AppDelegate).people!
//        for p in self.modelset{
//            self.dataset.append(p)
//        }
//    }
    
    init(data: NSFetchedResultsController<Person>){
        self.personsFetched = data
    }
    
//    convenience init(delegate : PersonSetViewModelDelegate) {
//        self.init()
//        self.delegate = delegate
//    }
    //-------------------------------------------------------------------------------------------------
    // MARK: View Model functions
    /// add a new person in set of persons
    ///
    /// - Parameter person: Person to be added
    public func add(person: Person){
        if let indexPath = self.personsFetched.indexPath(forObject: person){
            self.delegate?.personAdded(at: indexPath)
        }
    }
//    public func add(person: Person){
//        if self.modelset.indexOf(person: person) == nil{
//            self.modelset.add(person: person)
//            self.dataset.append(person)
//            self.delegate?.personAdded(at: IndexPath(row:self.modelset.count-1,section:0))
//        } }
    /// numbers of persons
    ///
    /// - Returns: number of persons
    public var count : Int{
//        return self.dataset.count
        return self.personsFetched.fetchedObjects?.count ?? 0
    }
    /// return ith Person
    ///
    /// - Parameter index: index of person to be returned
    /// - Returns: Person at index if 0 <= index < self.count, else nil
    public func get(personAt index: Int) -> Person?{
        return self.personsFetched.object(at: IndexPath(row: index, section: 0))
//        guard (index >= 0 ) && (index < self.count) else { return nil }
//        return self.dataset[index]
    }
    /// update birth date of Person
    ///
    /// - Parameters:
    ///   - indexPath: (section,row) of Person we want to update the birth date
    ///   - date: birth date
//    public func updateBirthDate(atIndexPath indexPath: IndexPath, withDate date: Date){
//        let person = self.modelset[indexPath.row]
//        person.birthDate = date
//        self.dataset[indexPath.row] = person
//        self.delegate?.personUpdated(at: indexPath)
//    }
    public func updateBirthDate(atIndexPath indexPath: IndexPath, withDate date: Date){
        let person = self.personsFetched.object(at: indexPath)
        person.birthDate = date
        self.delegate?.personUpdated(at: indexPath)
    }
    
}
