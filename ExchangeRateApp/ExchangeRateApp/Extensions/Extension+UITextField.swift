//
//  Extension+UITextField.swift
//  FluperTest
//
//  Created by HARISH KUMAR on 07/03/20.
//  Copyright © 2020 Harish Kumar. All rights reserved.
//

import Foundation
import UIKit

extension UITextField {
    
    func setPadding () {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 42, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
    
    func setPaddingWithImage (thisImage: UIImage?) {
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.size.height, height: self.frame.size.height))
        let imageviewIcon =  UIImageView()
        imageviewIcon.frame =  CGRect(x: 6, y: 6, width: 30, height: 30)//paddingView.frame
        imageviewIcon.image =  thisImage
        paddingView.addSubview(imageviewIcon)
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
    }
    
    func addBorder() {
        self.layer.borderColor = UIColor.red.cgColor
        self.layer.borderWidth = 2.0
    }
    
    func removeBorder() {
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.borderWidth = 0.0
    }
}
