//
//  ItTripPersonSet.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 03/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation

class ItPersonTripSet : IteratorProtocol {
    
    typealias Element = PersonTrip
    var iteratorIndex: Int = 0
    
    var personTrip = PersonTripSet()
    
    init(personTrip:PersonTripSet) {
        self.personTrip = personTrip
    }
    
    func next() -> PersonTrip? {
        if self.iteratorIndex >= personTrip.count-1 {
            return nil
        }
        else {
            self.iteratorIndex += 1
        }
        
        return self.personTrip.personTripList[iteratorIndex]
    }
    
    func next() -> Trip? {
        if self.iteratorIndex >= personTrip.count-1 {
            return nil
        }
        else {
            self.iteratorIndex += 1
        }
        
        return self.personTrip.tripList[iteratorIndex]
    }
    
    func next() -> Person? {
        if self.iteratorIndex >= personTrip.count-1 {
            return nil
        }
        else {
            self.iteratorIndex += 1
        }
        
        return self.personTrip.personList[iteratorIndex]
    }
    
    func reset(){
        self.iteratorIndex = 0
    }
    
    var currentTrip:Trip?{
        if iteratorIndex >= personTrip.count{
            return nil
        }
        else{
            return self.personTrip.tripList[iteratorIndex]
        }
    }
    
    var currentPerson:Person?{
        if iteratorIndex >= personTrip.countPersons{
            return nil
        }
        else{
            return self.personTrip.personList[iteratorIndex]
        }
    }
    
    var current:PersonTrip?{
        if iteratorIndex >= personTrip.count{
            return nil
        }
        else{
            return self.personTrip.personTripList[iteratorIndex]
        }
    }
    
    var end:Bool{
        return self.iteratorIndex >= personTrip.count
    }
    
    
}
