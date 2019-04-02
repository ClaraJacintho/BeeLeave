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
    
    public var balance : Double {
        get{ return self.pbalance }
        set{ self.pbalance = newValue }
    }
    
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
        self.hasExpense = expense
        self.pbalance = balance
    }
    
    convenience init(person: Person, trip: Trip){
        self.init(context: CoreDataManager.context)
        let expense : Expense? = nil
        self.hasPerson = person
        self.hasTrip  = trip
        self.hasExpense = expense
        self.pbalance = 0.0
    }   
    
}
