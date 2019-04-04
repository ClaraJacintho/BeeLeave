//
//  PersonPresenter.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit

protocol PersonPresenterProtocol {
    func text(ofPerson person:  Person) -> String
    func birthDate(ofPerson person: Person) -> String
}


class PersonPresenter{
    fileprivate var firstName : String = ""
    fileprivate var lastName : String = ""
    
    
//    func text(ofPerson person:  Person) -> String{
//        let date = self.birthDate(ofPerson: person)
//        if date.isEmpty{
//            return person.fullName
//        }
//        else{
//            return person.fullName + " - " + date
//        }
//    }
//    func birthDate(ofPerson person: Person) -> String{
//        guard let date = person.birthDate else{
//            return ""
//        }
//        let df = DateFormatter()
//        df.dateFormat = "dd/mm/yy"
//        let ret = df.string(from: date)
//        return ret
//    }
    
}
