//
//  Person.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit
import Foundation
//

extension Person{
    // MARK: -
    /// firstname of Person
    public var firstName : String { return self.pfirstName ?? "" }
    /// lastname of Person
    public var lastName  : String { return self.plastName  ?? "" }
    
    
    public var arrivalDate : Date? {
        get{ return self.parrivaldate }
        set{ self.parrivaldate = newValue }
    }
    
//    public var pphoto : NSData {
//        return self.photo! as NSData
//    }
    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    ///

//
//    public var trip : Trip?{
//        get{ return self.onTrip }
//        set{ self.onTrip = newValue }
//    }
//
    /// fullname property: `String` firstname lastname (read-only)
    public var fullName: String {
        return self.firstName + " " + self.lastName
    }

    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    ///   - birthdate: `Date` birth date pf `Person`
    convenience init(firstName: String, lastName: String, arrivalDate: Date){
        self.init(context: CoreDataManager.context)
        self.pfirstName = firstName
        self.plastName  = lastName
        //self.pbirthDate = nil
        self.arrivalDate = arrivalDate
        //self.photo = photo as Data
        //self.trip = trip
    }
    
    convenience init(firstName: String, lastName: String, arrivalDate: Date, personTrip : PersonTrip){
        self.init(context: CoreDataManager.context)
        self.pfirstName = firstName
        self.plastName  = lastName
        //self.pbirthDate = nil
        self.arrivalDate = arrivalDate
        self.trip?.adding(personTrip)
        //self.photo = photo as Data
        //self.trip = trip
    }
    
    func addPersonTrip(personTrip : PersonTrip) {
        self.trip?.adding(personTrip)
    }
    
    func save() {
        print("Salvando nova pessoa")
        if CoreDataManager.context.hasChanges {
            print("pois mudou algo")
            do {
                try CoreDataManager.context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}
