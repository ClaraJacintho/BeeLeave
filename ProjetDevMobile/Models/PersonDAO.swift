//
//  PersonDAO.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 03/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import CoreData

class PersonDAO {
    static let request :NSFetchRequest<Person> = Person.fetchRequest()
    
    static func getAllPersons()->[Person]{
        do{
            return try CoreDataManager.context.fetch(self.request)
        } catch {
            return []
        }
    }
}
