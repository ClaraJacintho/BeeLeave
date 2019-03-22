//
//  PersonDetailViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 22/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class PersonDetailViewController: UIViewController {
    
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastnameLabel: UILabel!
    @IBOutlet weak var birthdateLabel: UILabel!
    
    //@IBOutlet var presenter: PersonPresenter!
    //    @IBOutlet var presenter: PersonPresenter!
    var person : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let aperson = self.person{
            self.lastnameLabel.text = aperson.lastName
            self.firstnameLabel.text = aperson.firstName
            self.birthdateLabel.text = String(aperson.age ?? 0)
            
            //self.lastnameLabel.resize
            //self.presenter.birthDate(ofPerson: aperson)
            
        } else{
            self.lastnameLabel.text = ""
            self.firstnameLabel.text = ""
            self.birthdateLabel.text = ""
           
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
