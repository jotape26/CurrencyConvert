//
//  ConversionCell.swift
//  CurrencyConvert
//
//  Created by João Leite on 18/02/18.
//  Copyright © 2018 João Leite. All rights reserved.
//

import UIKit

class ConversionCell: UITableViewCell {

    @IBOutlet weak var lblCurrencyKey: UILabel!
    @IBOutlet weak var lblConversionResult: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
