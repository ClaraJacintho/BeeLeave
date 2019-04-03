//
//  PersonTripSet.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 03/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation

class PersonTripSet : Sequence {
    
    var tripList : [Trip]
    var personList : [Person]
    var personTripList : [PersonTrip]
    
    init(){
        self.tripList = TripDAO.getAllTrips()
        self.personList = PersonDAO.getAllPersons()
        self.personTripList = PersonTripDAO.getAllPersonTrip()
    }
    
    var isEmpty : Bool {
        return self.tripList.isEmpty && self.personList.isEmpty
    }
    
    var isTripListEmpty : Bool {
        return self.tripList.isEmpty
    }
    
    var isPersonListEmpty : Bool {
        return self.personList.isEmpty
    }
    
    func add(trip : Trip){
        if self.contains(trip : trip){
            return
        } else {
            tripList.append(trip)
        }
    }
    
    func remove(trip : Trip){
        guard let index = self.indexOf(trip: trip) else {
            return
        }
        tripList.remove(at: index)
    }
    
    func add(person : Person){
        if self.contains(person : person){ return }
        else {
            personList.append(person)
        }
    }
    
    func remove(person : Person){
        guard let index = self.indexOf(person : person) else { return }
        personList.remove(at: index)
    }
    
    //Returns the number of trips
    var count : Int {
        return NSSet(array: tripList).count
    }
    
    var countPersons : Int {
        return NSSet(array: personList).count
    }
    
    func indexOf(trip : Trip) -> Int? {
        var i : Int? = nil
        for index in 0..<tripList.count {
            if tripList[index].tripTitle == trip.tripTitle {
                i = index
            }
        }
        return i
    }
    
    func indexOf(person : Person) -> Int? {
        var i : Int? = nil
        for index in 0..<personList.count {
            if personList[index].fullName == person.fullName {
                i = index
            }
        }
        return i
    }
    
    func contains(trip : Trip)-> Bool {
        var contains : Bool = false
        for trips in tripList {
            if trips.tripTitle==trip.tripTitle {
                contains = true
            }
        }
        return contains
    }
    
    func contains(person : Person)-> Bool {
        var contains : Bool = false
        for persons in personList {
            if persons.fullName==person.fullName {
                contains = true
            }
        }
        return contains
    }
    
    func look(trip: Trip) -> Trip? {
        guard let index = indexOf(trip: trip) else{
            return nil
        }
        return tripList[index]
    }
    
    func look(person: Person) -> Person? {
        guard let index = indexOf(person: person) else{
            return nil
        }
        return personList[index]
    }
    
    func makeIterator() -> ItPersonTripSet{
        let iterator: ItPersonTripSet = ItPersonTripSet(personTrip: self)
        return iterator
    }
    
}
