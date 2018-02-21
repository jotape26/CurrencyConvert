//
//  ViewController.swift
//  CurrencyConvert
//
//  Created by João Leite on 18/02/18.
//  Copyright © 2018 João Leite. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var txtValue: UITextField!
    @IBOutlet weak var tblConversion: UITableView!
    
    // Change from LET to VAR when currency changes are implemented.
    let URL = "https://api.fixer.io/latest?base=USD"
    let currencies = ["AUD","BGN","BRL","CAD","CHF","CNY","CZK","DKK","EUR","GBP","HKD","HRK","HUF","IDR","ILS","INR","ISK","JPY","KRW","MXN","MYR","NOK","NZD","PHP","PLN","RON","RUB","SEK","SGD","THB","TRY","ZAR"]
    
    var conversion = Dictionary<String, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        Alamofire.request(URL).responseJSON { (response) in
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                if let rates = JSON["rates"]{
                    self.conversion = rates as! [String : AnyObject]
                }
            }
        }
        
        tblConversion.delegate = self
        tblConversion.dataSource = self
        txtValue.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func showCount(_ sender: Any) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.conversion.count == 0){
            return 0
        }else{
            return self.conversion.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tblConversion.dequeueReusableCell(withIdentifier: "ConversionCell", for: indexPath) as? ConversionCell
        cell?.lblCurrencyKey.text = currencies[indexPath.row]

        let value = Double("\(String(describing: self.txtValue.text!))")
        let currencyRate = Double("\(self.conversion[currencies[indexPath.row]]!)")
            
        let conversionValue = value! * currencyRate!
            
        cell?.lblConversionResult.text = String(format: "%.2f", conversionValue)

        return cell!
    }

    @IBAction func calculateConversion(_ sender: Any) {
        if (txtValue.text?.isEmpty == false){
            self.tblConversion.reloadData()
        }
    }
}
