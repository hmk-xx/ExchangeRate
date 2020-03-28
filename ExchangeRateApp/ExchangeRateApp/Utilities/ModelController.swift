//
//  ModelController.swift
//  FluperTest
//
//  Created by HARISH KUMAR on 24/02/20.
//  Copyright © 2020 Harish Kumar. All rights reserved.
//
import UIKit

class ModelController: NSObject {
  
    //Method for get Build Version and Build Number
    func methodForApplicationVersion() ->String{
        
        let nsObject: AnyObject? = Bundle.main.infoDictionary!["CFBundleShortVersionString"] as AnyObject?
        let version = nsObject as! String
        
        let buildNumber: AnyObject? =  Bundle.main.infoDictionary?["CFBundleVersion"] as AnyObject?
        let number = buildNumber as! String
        let stringApplicationVersion = #"V\#(version) (\#(number))"#
        return stringApplicationVersion
    }
    
    func makeCall(contactNumber:String){
        //telprompt:
        if let phoneCallURL = URL(string: "tel://\(contactNumber)") {
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                if #available(iOS 10.0, *) {
                    application.open(phoneCallURL, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                    application.openURL(phoneCallURL as URL)
                }
            }
        }
    }
    
    func openUrl(urlString: String) {
        guard let url = URL(string: urlString) else {
             return
         }
        if UIApplication.shared.canOpenURL(url) {
             UIApplication.shared.open(url, options: [:], completionHandler: nil)
         }
    }
}
