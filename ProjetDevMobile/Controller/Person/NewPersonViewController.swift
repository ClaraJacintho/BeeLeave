//
//  NewPersonViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 20/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class NewPersonViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {

    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var arrivalDate: UIDatePicker!
    var newPerson : Person?
    var trip: Trip?
    var personTrip : PersonTrip?
    
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "okNewPerson" {
            let firstname : String  = self.firstnameTextField.text!
            let lastname  : String  = self.lastnameTextField.text!
            let arrivalDate : Date    = self.arrivalDate.date
            
//            guard let imgData = self.imageView.image?.jpegData(compressionQuality: 1) else {
//                print("jpg error")
//                //TODO
//                //Alert
//                return
//            }
            
            self.newPerson = Person(firstName: firstname, lastName: lastname, arrivalDate: arrivalDate)
            self.personTrip = PersonTrip(person: self.newPerson!, trip: self.trip!)
            
//            CoreDataManager.save()
//            
//            
//            print("Algo mudou?")
//            print(CoreDataManager.context.hasChanges)
            
            //CoreDataManager.context.refres
            
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
    
    @IBAction func imageClicked(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            
            
            imagePicker.delegate = self
            imagePicker.sourceType = .savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.contentMode = .scaleAspectFit
            self.imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }

}
