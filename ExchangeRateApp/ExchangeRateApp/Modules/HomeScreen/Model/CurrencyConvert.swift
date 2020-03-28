//
//  CurrencyConvert.swift
//  ExchangeRateApp
//
//  Created by HARISH KUMAR on 27/03/20.
//  Copyright © 2020 Harish. All rights reserved.
//

import Foundation

struct CurrencyConvert {
    
    var convertRate: Any?
    let base: String?
    let date: String?
    
    
    init(_ dict: [String: Any]) {

        base = dict["base"] as? String ?? ""
        date = dict["date"] as? String ?? ""
       
        if let items = dict["rates"] as? [String: Any] {
            for key in items.keys{
                convertRate = items[key] ?? 0.0
            }
        }
       
    }
}
