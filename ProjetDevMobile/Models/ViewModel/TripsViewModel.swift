//
//  TripsViewModel.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 24/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//
import Foundation
import UIKit
import CoreData

protocol TripViewModelDelegate {

    func dataSetChanged()

    func tripDeleted(at indexPath: IndexPath)

    func tripUpdated(at indexPath: IndexPath)

    func tripAdded(at indexPath: IndexPath)
}

class TripsViewModel{

    var delegate : TripViewModelDelegate? = nil
    var tripsFetched : NSFetchedResultsController<Trip>?
    
    init(data: NSFetchedResultsController<Trip>){
        self.tripsFetched = data
    }
    
    init(){
    }

    public func add(trip: Trip){
        if let indexPath = self.tripsFetched!.indexPath(forObject: trip){
            self.delegate?.tripAdded(at: indexPath)
        }
    }
   
    public var count : Int{
        return self.tripsFetched!.fetchedObjects?.count ?? 0
    }
    
    public func get(tripAt index: Int) -> Trip?{
        return self.tripsFetched!.object(at: IndexPath(row: index, section: 0))
    }
    
    public func upddateAddPerson(atIndexPath indexPath: IndexPath, withPerson person: Person){
        _ = self.tripsFetched!.object(at: indexPath)
        self.delegate?.tripUpdated(at: indexPath)
    }
    
}
