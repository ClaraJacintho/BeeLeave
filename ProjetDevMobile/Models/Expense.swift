//
//  Expense.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 02/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import CoreData

extension Expense {
    public var cost : Double {
        get{ return self.pcost }
        set{ self.pcost = newValue }
    }
        
    convenience init(paidBy: Person, cost: Double, tripData: PersonTrip){
        self.init(context: CoreDataManager.context)
        self.paidBy = paidBy
        self.tripExpense = tripData
        self.pcost = cost
    }
    
}
