//
//  NewTripViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 24/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit

class NewTripViewController: UIViewController, UITextFieldDelegate {
 

    @IBOutlet weak var tripTitle: UITextField!
    @IBOutlet weak var startDate: UITextField!
    @IBOutlet weak var endDate: UITextField!
    
    var newTrip : Trip?
    
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
            print(self.startDate.text)
            guard let start : Date = dateFormatter.date(from: (self.startDate.text) ?? "11/23/1963") else {
                fatalError() //how to just like, alert the person to fill the date?
            }
            guard let end : Date = dateFormatter.date(from: self.endDate.text ?? "11/23/1963") else {
                fatalError()
            }
            
            self.newTrip = Trip(title: title, start: start, end: end)
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
    
}
