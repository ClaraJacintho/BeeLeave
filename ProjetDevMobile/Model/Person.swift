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
    public var firstname : String { return self.pfirstName ?? "" }
    /// lastname of Person
    public var lastname  : String { return self.plastName  ?? "" }
    /// birth date property: `(Date|Empty)` a `Person` can have no birth date
    public var birthdate : Date? {
        get{ return self.pbirthDate }
        set{ self.pbirthDate = newValue }
    }
    /// fullname property: `String` firstname lastname (read-only)
    public var fullname: String {
        return self.firstname + " " + self.lastname
    }
    /// age property: (Int|Empty) - empty if no birthdate, else age in years
    var age : Int? {
        guard let birth = self.birthdate else{
            return nil
        }
        let today : Date = Date()
        return Calendar.current.dateComponents([.year], from: birth, to: today).year
    }
//    public var city : String?{
//        get{ return self.inhabit?.pcity }
//        set{
//            if let town = self.inhabit{
//                town.pcity = newValue
//            } else{
//                self.inhabit = Town(context: CoreDataManager.context)
//                self.inhabit?.pcity = newValue
//            }
//        } }
//    public var country : String? {
//        get { return self.inhabit?.pcountry }
//        set {
//            if let town = self.inhabit{
//                town.pcountry = newValue
//            } else{
//                self.inhabit = Town(context: CoreDataManager.context)
//                self.inhabit?.pcountry = newValue
//            }
//        } }
    /// text description of person
    override public var description : String {
        var fullname =  self.firstname + " " + self.firstname
        if let birthdate = self.pbirthDate{
            fullname += " " + birthdate.description
        }
        return fullname
    }
    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    convenience init(firstname: String, lastname: String){
        self.init(context: CoreDataManager.context)
        self.pfirstName = firstname
        self.plastName  = lastname
        self.pbirthDate = nil
    }
    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    ///   - birthdate: `Date` birth date pf `Person`
    convenience init(firstname: String, lastname: String, birthdate: Date){
        self.init(context: CoreDataManager.context)
        self.pfirstName = firstname
        self.plastName  = lastname
        self.pbirthDate = birthdate
    }
    /// initialize a `Person`
    ///
    /// - Parameters:
    ///   - firstname: `String` first name of `Person`
    ///   - lastname:  `String` last name of `Person`
    ///   - birthdate: `Date` birth date pf `Person`
    convenience init(firstname: String, lastname: String, birthdate: Date, city: String?, country: String?){
        self.init(context: CoreDataManager.context)
        self.pfirstName = firstname
        self.plastName  = lastname
        self.pbirthdate = birthdate
//        if (city==nil) && (country==nil){
//            self.inhabit = nil
//        } else{
//            if let town = TownDAO.search(forCity: city, andCountry: country){
//                self.inhabit = town
//            } else{
//                self.inhabit = Town(context: CoreDataManager.context)
//                self.inhabit?.pcity    = city
//                self.inhabit?.pcountry = country
//            }
//        }
    }
    
}



//class Person {
//    var lastName: String
//    var firstName: String
//    
//    var fullName: String {
//        return self.firstName + " " + self.lastName
//    }
//    
//    var birthDate: Date?
//    var age: Int? {
//        guard let birth = self.birthDate else {
//            return nil
//        }
//        let today : Date = Date()
//        return Calendar.current.dateComponents([.year], from: birth, to: today).year // retorna apenas o valor do ano
//    }
//    
//    var description : String {
//        var fullName = self.firstName + " " + self.lastName
//        if let birthdate = self.birthDate{
//            fullName += " " + birthdate.description
//        }
//        return fullName
//    }
//    
//    init(firstName: String, lastName: String){
//        self.firstName = firstName
//        self.lastName = lastName
//        //self.fullName = firstName + " " + lastName
//    }
//    
//}
//
//extension Person : Equatable {
//    static func == (lhs: Person, rhs: Person) -> Bool {
//        var dateeq : Bool = false
//        if let lb = lhs.birthDate{
//            if let rb = rhs.birthDate{
//                dateeq = lb.compare(rb) == ComparisonResult.orderedSame
//            }
//        }else{
//            dateeq = (rhs.birthDate == nil)
//        }
//        return lhs.firstName == rhs.firstName &&
//            lhs.lastName == rhs.lastName && dateeq
//    }
//    
//    static func != (lhs: Person, rhs: Person) -> Bool {
//        return !(lhs == rhs)
//    }
//}
