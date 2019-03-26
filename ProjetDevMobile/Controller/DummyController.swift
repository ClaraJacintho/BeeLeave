//
//  DummyController.swift
//  ProjetDevMobile
//
//  Created by Delton de Andrade Vaz on 26/03/2019.
//  Copyright © 2019 Delton de Andrade Vaz. All rights reserved.
//

import Foundation
import UIKit


class DummyController: NSObject, UITableViewDataSource {
    
    var tv : UITableView
    
    init(_ tv: UITableView){
        self.tv = tv
        super.init()
        self.tv.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dummyCell", for: indexPath)
        cell.textLabel?.text = "hello"
        return cell
    }
    
    
}
