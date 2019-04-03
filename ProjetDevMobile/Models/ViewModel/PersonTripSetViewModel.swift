//
//  PersonTripSetViewModel.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 02/04/19.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation

class PersonTripSetViewModel{
    
    var personTripSet:[PersonTripViewModel] = []
    
//    init(tripSet: TripSet){
//        for trip in tripSet.tripList{
//            self.tripSet.append(TripViewModel(trip: trip))
//        }
//    }
//    
    var tripSet:[TripsViewModel] = []
    
    
    init(personTripSet: PersonTripSet){
        for trip in personTripSet.tripList{
            //var tripsViewModel : TripsViewModel = TripsViewModel.init()
            //self.tripSet.append(tripsViewModel.add(trip: trip))
        }
    }
    
}
