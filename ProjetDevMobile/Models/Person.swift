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
    /// birth date property: `(Date|Empty)` a `Person` can have no birth date
    public var birthDate : Date? {
        get{ return self.pbirthDate }
        set{ self.pbirthDate = newValue }
    }
    
    
    public var arrivalDate : Date? {
        get{ return self.parrivalDate }
        set{ self.parrivalDate = newValue }
    }
    
    public var departurelDate : Date? {
        get{ return self.pdepartureDate }
        set{ self.pdepartureDate = newValue }
    }
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
    /// age property: (Int|Empty) - empty if no birthdate, else age in years
    var age : Int? {
        guard let birth = self.birthDate else{
            return nil
        }
        let today : Date = Date()
        return Calendar.current.dateComponents([.year], from: birth, to: today).year
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
        //self.trip = trip
    }

}
