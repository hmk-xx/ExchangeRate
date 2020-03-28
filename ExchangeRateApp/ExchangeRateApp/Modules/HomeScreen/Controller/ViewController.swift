//
//  ViewController.swift
//  ExchangeRateApp
//
//  Created by HARISH KUMAR on 27/03/20.
//  Copyright © 2020 Harish. All rights reserved.
//

import UIKit

enum Validations {
    case emptyField
}

class ViewController: UIViewController {
    
    @IBOutlet weak var buttonFrom: UIButton!
    @IBOutlet weak var buttonTo: UIButton!

    
    @IBOutlet weak var textFieldConvertFrom: UITextField!
    @IBOutlet weak var textFieldConvertTo: UITextField!

    @IBOutlet weak var tableviewConvertFrom: UITableView!
    @IBOutlet weak var tableviewConvertTo: UITableView!
    
    @IBOutlet weak var labelResult: UILabel!

    
    let arrayCurrencies: [String] = ["CAD", "HKD", "ISK", "PHP", "DKK", "HUF", "CZK", "AUD", "RON", "SEK", "IDR", "INR", "BRL", "RUB", "HRK", "JPY", "THB", "CHF", "SGD", "PLN", "BGN", "TRY", "CNY", "NOK", "NZD", "ZAR", "USD", "MXN", "ILS", "GBP", "KRW", "MYR"]
    var stringFrom: String = ""
    var stringTo: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.configureUITableView()
    }
    @IBAction func selectFrom() {
        tableviewConvertFrom.isHidden = false
        tableviewConvertTo.isHidden = true
    }
    
    @IBAction func selecTo() {
        tableviewConvertFrom.isHidden = true
        tableviewConvertTo.isHidden = false
    }
    
    @IBAction func convert() {
        if textFieldConvertFrom.text!.isEmpty && textFieldConvertTo.text!.isEmpty {

            textFieldConvertFrom.addBorder()
            textFieldConvertTo.addBorder()

        } else if textFieldConvertFrom.text!.isEmpty {

            textFieldConvertFrom.addBorder()

        } else if textFieldConvertTo.text!.isEmpty {

            textFieldConvertTo.addBorder()

        } else {
            if textFieldConvertFrom.text! == textFieldConvertTo.text! {
                let actionAlert: UIAlertController = UIAlertController(title: nil, message:"Both currencies are same. Pleases select different." , preferredStyle: .alert)
                let cancelButton: UIAlertAction = UIAlertAction(title: kCancelButton, style: .cancel) { void in
                }
                actionAlert.addAction(cancelButton)
                actionAlert.view.tintColor = UIColor(red: 30/255, green: 166/255, blue: 100/255, alpha: 1.0)
                self.present(actionAlert, animated: true, completion: nil)
            } else {
                OverlayView.shared.showOverlay(view: self.view)
                getConversionRate()
            }
        }
        
    }
}

extension ViewController {
    func configureUITableView() {
       
        let nib = UINib(nibName: TableViewCells.exchangeTableViewCell, bundle: nil)
        tableviewConvertFrom.register(nib, forCellReuseIdentifier: TableViewCells.exchangeTableViewCell)
        tableviewConvertTo.register(nib, forCellReuseIdentifier: TableViewCells.exchangeTableViewCell)

        tableviewConvertFrom.delegate = self
        tableviewConvertFrom.dataSource = self
        
        tableviewConvertTo.delegate = self
        tableviewConvertTo.dataSource = self
        
        tableviewConvertFrom.reloadData()
        tableviewConvertTo.reloadData()

    }
    
    func getConversionRate() {
        tableviewConvertFrom.isHidden = true
        tableviewConvertTo.isHidden = true
        if Reachability.isConnectedToNetwork() == true {
            let dictionary: NSDictionary = ["" : ""]
                ServiceManager.methodGETServerRequest(String(format: "%@base=%@&symbols=%@", baseUrl ,stringFrom, stringTo), andParameters: dictionary as! [String : AnyObject], success: { response in
                        if response is NSDictionary{
                        
                            OverlayView.shared.hideOverlayView()
                            let result = CurrencyConvert(response as! [String : Any])
                            if let rate:NSNumber =  result.convertRate as? NSNumber {
                                self.labelResult.text = String(format: "1 %@ = %@ %@", result.base ?? "", rate , self.stringTo)
                            }
                        } else {
                            OverlayView.shared.hideOverlayView()
                        }
                    }, failure: { error in
                        OverlayView.shared.hideOverlayView()
                    })
        }else{
            
        }
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCells.exchangeTableViewCell, for: indexPath) as! ExchangeTableViewCell
        cell.showCurrencyData(currency: arrayCurrencies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.tag == 111 {
            stringFrom =  arrayCurrencies[indexPath.row]
            textFieldConvertFrom.text = stringFrom
        } else {
            stringTo =  arrayCurrencies[indexPath.row]
            textFieldConvertTo.text = stringTo
        }
        
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        if textField.tag == 111 {
            tableviewConvertFrom.isHidden = false
            tableviewConvertTo.isHidden = true

        } else {
            tableviewConvertFrom.isHidden = true
            tableviewConvertTo.isHidden = false
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //textField.removeBorder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing")
        return true
    }
}
