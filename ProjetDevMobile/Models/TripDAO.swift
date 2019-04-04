//
//  TripDAO.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 02/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import CoreData

class TripDAO {
    static let request : NSFetchRequest<Trip> = Trip.fetchRequest()
    
    static func countAllPersonsOnTrip(byTrip trip : Trip) -> Int{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request).count
        }
        catch{
            return 0
        }
    }
    
    static func getSumExpenses(byTrip trip : Trip) -> Double {
        var totalCostValue : Double = 0.0
        for personTable in (trip.person?.allObjects)! as! [PersonTrip] {
            for expenses in (personTable.hasExpense!){
                totalCostValue += (expenses as! Expense).pcost
            }
        }
        return totalCostValue
    }
    
    static func getAllTrips() -> [Trip]{
        self.request.predicate = nil
        do{
            return try CoreDataManager.context.fetch(self.request)
        }
        catch{
            return []
        }
    }
    
}
