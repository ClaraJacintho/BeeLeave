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
    var personTrip : [PersonTrip] = []
    
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
        //self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return []
        }
    }
    
    static func getAllPersonTrip(byTrip trip : Trip) -> [PersonTrip]{
        self.request.predicate = NSPredicate(format: "hasTrip == %@", trip)
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return []
        }
    }
    
    static func getNextToPayByTrip(byTrip trip : Trip) -> Person? {
        self.request.predicate = NSPredicate(format: "hasTrip == %@", trip)
        var personTrip : [PersonTrip] = []
        var max : Double = 0.0
        var nextToPay : Person?
        do{
            personTrip = try CoreDataManager.context.fetch(self.request)
            for person in personTrip {
                for expenses in (person.hasExpense!){
                    if (((expenses as! Expense).pcost) >= max) {
                        nextToPay = ((expenses as! Expense).paidBy?.hasPerson)!
                        max = (expenses as! Expense).pcost
                    }
                    print("Entrou no segundo")
                    NSLog(String((expenses as! Expense).pcost))
                    NSLog(((expenses as! Expense).paidBy?.hasPerson?.fullName)!)
                }
            }
            return nextToPay
        }
        catch{
            return nextToPay
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
