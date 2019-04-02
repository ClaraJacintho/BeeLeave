//
//  Trip.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 24/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit

extension Trip{
    
    //public var firstName : String { return self.pfirstName ?? "" }
    public var tripTitle : String { return self.ttitle ?? "Gustavus Aldolphus Appreciation Tour"}
    public var tripStart : Date { return self.tstart ?? Date()}
    public var tripEnd : Date { return self.tend ?? Date()}
    public var tripPhoto : NSData {
        return self.tphoto! as NSData
    }
    
//    public var person : Person {
//        return self.participants
//    }
    //public var photo : 
    
    convenience init(title: String, start: Date, end : Date){
        self.init(context: CoreDataManager.context)
        self.ttitle = title
        self.tstart = start
        self.tend = end
    }
    
    convenience init(title: String, start: Date, end : Date, photo: NSData){
        self.init(context: CoreDataManager.context)
        self.ttitle = title
        self.tstart = start
        self.tend = end
        self.tphoto = photo as Data
    }

}
