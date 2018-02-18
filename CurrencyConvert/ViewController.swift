//
//  ViewController.swift
//  CurrencyConvert
//
//  Created by João Leite on 18/02/18.
//  Copyright © 2018 João Leite. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var tblConversion: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblConversion.dequeueReusableCell(withIdentifier: "ConversionCell", for: indexPath) as? ConversionCell
        
        return cell!
    }


}

