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
    
    var newPerson : Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "okNewPersonSegue" {
            let firstname : String  = self.firstnameTextField.text!
            let lastname  : String  = self.lastnameTextField.text!
            let birthdate : Date    = self.birthdatePicker.date
            self.newPerson = Person(firstName: firstname, lastName: lastname)
            self.newPerson?.birthDate = birthdate
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
