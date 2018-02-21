//
//  RequestHelper.swift
//  CurrencyConvert
//
//  Created by João Leite on 18/02/18.
//  Copyright © 2018 João Leite. All rights reserved.
//

import Foundation
import Alamofire

class RequestHelper{
    
    static func Request(URL: String) -> Dictionary<String, AnyObject> {
        var ResponseJSON = Dictionary<String, AnyObject>()
        
        Alamofire.request(URL).responseJSON { (response) in
            if let JSON = response.result.value as? Dictionary<String, AnyObject> {
                if let rates = JSON["rates"]{
                    ResponseJSON = rates as! [String : AnyObject]
                    print(rates)
                }
            }
        }
    
        return ResponseJSON
    }
}
