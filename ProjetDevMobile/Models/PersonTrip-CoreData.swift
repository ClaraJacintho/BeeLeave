//
//  PersonTrip.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 02/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import CoreData

extension PersonTrip {
    
    static let request : NSFetchRequest<PersonTrip> = PersonTrip.fetchRequest()
    
    public var balance : Double {
        get{ return self.pbalance }
        set{ self.pbalance = newValue }
    }
    
    //public var tripData 
    
    /// initialize a `PersonTrip relation`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    ///   - birthdate: `Date` birth date pf `Person`
    convenience init(person: Person, trip: Trip, expense: Expense, balance: Double){
        self.init(context: CoreDataManager.context)
        self.hasPerson = person
        self.hasTrip  = trip
        //self.hasExpense = expense
        self.pbalance = balance
    }
    
    convenience init(person: Person, trip: Trip){
        self.init(context: CoreDataManager.context)
        let expense : Expense? = nil
        self.hasPerson = person
        self.hasTrip  = trip
        //self.hasExpense = expense
        self.pbalance = 0.0
    }
    
    convenience init(trip: Trip){
        self.init(context: CoreDataManager.context)
        let expense : Expense? = nil
        let person : Person? = nil
        self.hasPerson = person
        self.hasTrip  = trip
        //self.hasExpense = expense
        self.pbalance = 0.0
    }
    
//    func addExpense(person: Person, cost: Double){
//        self.hasExpense?.pcost = cost
//        self.hasExpense?.paidBy = person
//    }
    
//    func addExpense(expense: Expense){
//        self.hasExpense = expense
//    }
    
    
    static func search(forPerson person: Person, trip: Trip) -> PersonTrip {
        self.request.predicate = NSPredicate(format: "hasPerson == %@ AND hasTrip == %@", person, trip)
        do{
            let result = try CoreDataManager.context.fetch(request) as [PersonTrip]
            guard result.count == 1 else { fatalError("duplicate entries") }
            return result[0]
        }
        catch{
            fatalError("not found")
        }
        
    }
    
}
