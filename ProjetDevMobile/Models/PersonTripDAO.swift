//
//  PersonTripDAO.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 03/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import CoreData

class PersonTripDAO{
    
    static let request :NSFetchRequest<PersonTrip> = PersonTrip.fetchRequest()
    
    static func save(){
        CoreDataManager.save()
    }
    
    static func delete(personTrip: PersonTrip){
        CoreDataManager.context.delete(personTrip)
    }
    
    static func insert(personTrip: PersonTrip){
        CoreDataManager.context.insert(personTrip)
    }
    
    static func count(byTrip trip : Trip) -> Int {
        return self.getPersonTripByTrip(trip: trip).count
    }
    
    static func getAllPersonTrip() -> [PersonTrip]{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return []
        }
    }
    
    static func getPersonTripByPerson(person: Person) -> [PersonTrip]{
        let personTrip = person.trip
        return personTrip as! [PersonTrip]? ?? []
    }
    
    static func getPersonTripByTrip(trip: Trip) -> [PersonTrip]{
        let personTrip = trip.person
        return personTrip as! [PersonTrip]? ?? []
    }
}
