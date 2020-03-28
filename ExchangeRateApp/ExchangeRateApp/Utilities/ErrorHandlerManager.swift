//
//  ErrorHandlerManager.swift
//  FluperTest
//
//  Created by HARISH KUMAR on 24/02/20.
//  Copyright © 2020 Harish Kumar. All rights reserved.
//

import UIKit

public class ErrorHandlerManager: NSObject {

   public func showAlert (stringTitle:String,stringMessaage:String,stringButtonTitle:String,view:UIViewController){
        
        let alert =  UIAlertController( title: stringTitle, message: stringMessaage, preferredStyle: .alert)
    let okAction = UIAlertAction( title: stringButtonTitle, style: UIAlertAction.Style.default) {
            _ in
        }
        alert.addAction(okAction)
        view.present(alert, animated: true, completion: nil)
    }
    
}
