//
//  NewTripViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 24/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit

class NewTripViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 

    @IBOutlet weak var tripTitle: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    var newTrip : Trip?
    
    var newPersonTrip : PersonTrip?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startDate.inputView = startPicker
        endDate.inputView = endPicker
        // Do any additional setup after loading the view.
        
    }
        
    lazy var startPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(startPickerChanged(_:)), for: .valueChanged)
        return picker
    }()
    
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    @objc func startPickerChanged(_ sender: UIDatePicker){
        startDate.text = dateFormatter.string(from: sender.date)
    }
    
    lazy var endPicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.addTarget(self, action: #selector(endPickerChanged(_:)), for: .valueChanged)
        return picker
    }()
    
    @objc func endPickerChanged(_ sender: UIDatePicker){
        endDate.text = dateFormatter.string(from: sender.date)
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "okNewTripSegue" {
            
            let title : String = self.tripTitle.text!
            //print(self.startDate.text)
            guard let start : Date = dateFormatter.date(from: (self.startDate.text) ?? "11/23/1963") else {
                fatalError() //how to just like, alert the person to fill the date?
            }
            guard let end : Date = dateFormatter.date(from: self.endDate.text ?? "11/23/1963") else {
                fatalError()
            }
            
            
            guard let imgData = self.imageView.image?.jpegData(compressionQuality: 1) else {
                print("jpg error")
                return
            }
                       
            self.newTrip = Trip(title: title, start: start, end: end, photo: imgData as NSData)
            
            //TODO
            self.newPersonTrip = PersonTrip(trip: self.newTrip!)
        }
        else{
            self.newTrip = nil
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func imageClicked(_ sender: Any) {
        print("Cliquei!")
//        imagePickerController = UIImagePickerController()
//        imagePickerController.delegate = self
//        imagePickerController.sourceType = .camera
//        present(imagePickerController, animated: true, completion: nil)
        
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
            print("Button capture")
            
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

    
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        imagePickerController.dismiss(animated: true, completion: nil)
//        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
//    }
//    
}
