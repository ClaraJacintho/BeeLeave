//
//  PersonDetailViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 22/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {

    //@IBOutlet var presenter: PersonPresenter!
    //    @IBOutlet var presenter: PersonPresenter!
    var person : Person?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var arrivalDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let aperson = self.person{
  
            self.nameLabel.text = aperson.fullName
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            
            self.arrivalDateLabel.text = formatter.string(from: aperson.arrivalDate ?? Date())
            
            
            //self.lastnameLabel.resize
            //self.presenter.birthDate(ofPerson: aperson)
            
        } else{
            self.nameLabel.text = ""
            self.arrivalDateLabel.text = ""
           
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
