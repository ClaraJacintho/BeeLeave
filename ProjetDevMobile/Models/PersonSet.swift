//
//  PersonSet.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit

class PersonSet : Sequence {
    fileprivate var setPerson: [Person] = []
    
    var count: Int {
        return self.setPerson.count
    }
    
    func makeIterator() -> ItPersonSet {
        return ItPersonSet(self)
    }
    
    //Done
    init() {
//        for _ in 1...10 {
//            let string1 = randomString(length: 5)
//            let string2 = randomString(length: 2)
//            let person = Person(firstName: "testNom"+string1, lastName: "testPrenom"+string2)
//            self.setPerson.append(person)
//        }
    }
    
    //Done
    init(person: Person) {
        self.setPerson.append(person)
    }
    
    //Done
    func isEmpty() -> Bool {
        return setPerson.isEmpty
    }
    
    //Done
    func add(person: Person) -> PersonSet {
        if !setPerson.contains(person){
            self.setPerson.append(person)
        }
        return self
    }
    
    //Done
    func remove(element: Person) -> PersonSet {
        if let index = self.setPerson.index(of: element) {
            self.setPerson.remove(at: index)
        }
        return self
    }
    
    
    //contains and look by Person
    //Done
    func contains(person: Person) -> Bool {
        return setPerson.contains(person)
    }
    
    //Done
//    func look(person: Person) -> Person? {
//        for p in self{
//            if( (p.firstName == person.firstName) && (p.lastName == person.lastName) && (p.age == person.age)){
//                return p
//            }
//        }
//        return nil
//    }
    
    //contains and look by firstName
    //Done
    func contains(personsWithFirstName firstName: String) -> Bool {
        return self.setPerson.contains(where: {$0.firstName==firstName})
    }
    
    //Done
    func look(forPersonsWithFirstName firstName: String) -> [Person] {
        var ret : [Person] = []
        for p in self{
            if( p.firstName == firstName){
                ret.append(p)
            }
        }
        return ret
    }
    
    //contains and look by lastName
    //Done
    func contains(forPersonsWithLastName lastName: String) -> Bool {
        return self.setPerson.contains(where: {$0.lastName==lastName})
    }
    
    //Done
    func look(forPersonsWithLasttname lastName: String) -> [Person] {
        var ret : [Person] = []
        for p in self{
            if( p.lastName == lastName){
                ret.append(p)
            }
        }
        return ret
    }
    
    //contains and look by prenom and nom
    // TODO test
    func contains(forPersonsWithFirstName firstName: String, withLastName lastName: String ) -> Bool {
        return self.setPerson.contains(where: {$0.firstName==firstName && $0.lastName==lastName})
    }
    
    //TODO test
    func look(forPersonsWithFirstName firstName: String, withLastName lastName: String) -> [Person] {
        var ret : [Person] = []
        for p in self{
            if( p.lastName == lastName && p.firstName == firstName){
                ret.append(p)
            }
        }
        return ret
    }
    
    //contains and look by prenom, nom and birthdate
    //TODO test
//    func contains(forPersonsWithFirstName firstName: String, withLastName lastName: String, withBirthDate birthDate: Date) -> Bool {
//        return self.setPerson.contains(where: {$0.firstName==firstName && $0.lastName==lastName && $0.birthDate==birthDate})
//    }
    
    
    //TODO test
//    func look(forPersonsWithFirstName firstName: String, withLastName lastName: String, withBirthDate birthDate: Date) -> Person? {
//        for p in self{
//            if( (p.firstName == firstName) && (p.lastName == lastName) && (p.birthDate == birthDate)){
//                return p
//            }
//        }
//        return nil
//    }
    
    
    //IndexOf
    //Done
    func index(of person: Person) -> Int? {
        return setPerson.index(of: person)
    }
    
    func indexOf(person: Person) -> Int? {
        return setPerson.index(of: person)
    }
    
    subscript(index: Int) -> Person {
        get {
            guard (index>=0) && (index<self.count) else{
                fatalError("Index out of range")
            }
            return self.setPerson[index]
        }
        set(newValue) {
            guard (index>=0) && (index<self.count) else{
                fatalError("Index out of range")
            }
            self.setPerson[index]=newValue
        }
    }
    
    func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
    
}

struct ItPersonSet : IteratorProtocol {
    private let personSet: PersonSet
    private var currentIndex: Int = 0
    
    init(_ personSet: PersonSet) {
        self.personSet = personSet
    }
    
    mutating func reset() -> ItPersonSet{
        self.currentIndex = 0
        return self
    }
    
    mutating func next() -> Person? {
        guard self.currentIndex < self.personSet.count else { //Guard is used to avoid lots of "if let" assignement
            return nil
        }
        let nextPerson = self.personSet.setPerson[self.currentIndex]
        self.currentIndex += 1
        return nextPerson
    }
    
    mutating func current() -> Person? {
        return self.personSet.setPerson[self.currentIndex]
    }
    
    mutating func end() -> Bool {
        return self.currentIndex < self.personSet.count
    }
    
}
