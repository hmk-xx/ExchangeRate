//
//  ExchangeTableViewCell.swift
//  ExchangeRateApp
//
//  Created by HARISH KUMAR on 27/03/20.
//  Copyright © 2020 Harish. All rights reserved.
//

import UIKit

class ExchangeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelCurrency: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showCurrencyData(currency: String?) {
        self.labelCurrency.text = currency
    }
    
}
