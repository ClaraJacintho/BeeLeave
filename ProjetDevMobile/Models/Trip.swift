//
//  Trip.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 24/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation

extension Trip{
    
    //public var firstName : String { return self.pfirstName ?? "" }
    public var tripTitle : String { return self.ttitle ?? "Gustavus Aldolphus Appreciation Tour"}
    public var tripStart : Date { return self.tstart ?? Date()}
    public var tripEnd : Date { return self.tend ?? Date()}
    //public var photo : 
    
    convenience init(title: String, start: Date, end : Date){
        self.init(context: CoreDataManager.context)
        self.ttitle = title
        self.tstart = start
        self.tend = end
    }

}
