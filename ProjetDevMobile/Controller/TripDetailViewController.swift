//
//  TripDetailViewController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 25/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {
    @IBOutlet weak var ttitle: UILabel!
    
    @IBOutlet weak var sdate: UILabel!
    @IBOutlet weak var edate: UILabel!
    //    @IBOutlet weak var firstnameLabel: UILabel!
//    @IBOutlet weak var lastnameLabel: UILabel!
//    @IBOutlet weak var birthdateLabel: UILabel!
    
    //@IBOutlet var presenter: PersonPresenter!
    //    @IBOutlet var presenter: PersonPresenter!
   // var person : Person?
    var trip : Trip?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("tripdetailviewController")
        // Do any additional setup after loading the view.
        if let atrip = self.trip{
            self.ttitle.text = atrip.ttitle
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            self.sdate.text = formatter.string(from: atrip.tstart!)
            self.edate.text = formatter.string(from: atrip.tend!)
       
            
        } else{
            self.ttitle.text = "Mistakes were made"
            self.sdate.text = ""
            self.edate.text = ""
            
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
