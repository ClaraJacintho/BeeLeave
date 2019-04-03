//
//  NewPersonViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class NewPersonViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var birthdatePicker: UIDatePicker!
    @IBOutlet weak var lastnameTextField: UITextField!

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var arrivalDate: UIDatePicker!
    var newPerson : Person?
    var trip: Trip?
    var personTrip : PersonTrip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "okNewPerson" {
            let firstname : String  = self.firstnameTextField.text!
            let lastname  : String  = self.lastnameTextField.text!
            let arrivalDate : Date    = self.arrivalDate.date
            self.newPerson = Person(firstName: firstname, lastName: lastname, arrivalDate: arrivalDate)
            self.personTrip = PersonTrip(person: self.newPerson!, trip: self.trip!)
            
            //self.expense = Expense(paidBy: self.newPerson, cost: 0.0, tripData: self.personTrip)
        }
        else{
            self.newPerson = nil
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            if text != ""{
                textField.resignFirstResponder()
                return true
            } }
        return false
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
