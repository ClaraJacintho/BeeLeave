//
//  TripItemTableViewCell.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 23/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class TripItemTableViewCell: UITableViewCell {
    @IBOutlet weak var tripImage: UIImageView?
    @IBOutlet weak var cityName: UILabel?
    @IBOutlet weak var startsDate: UILabel?
    @IBOutlet weak var endsDate: UILabel?
    @IBOutlet weak var nbParticipants: UILabel?
    @IBOutlet weak var participantAvatar: UIImageView?
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    

}
