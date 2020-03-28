//
//  OverlayView.swift
//  FluperTest
//
//  Created by HARISH KUMAR on 24/02/20.
//  Copyright © 2020 Harish Kumar. All rights reserved.
//
import Foundation
import UIKit

public class OverlayView{
    
    // MARK: - Variables
    
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    let messageLabel = UILabel()

    class var shared: OverlayView {
        struct Static {
            static let instance: OverlayView = OverlayView()
        }
        return Static.instance
    }
    
    // MARK: - Action Methods
    
    public func showOverlay(view: UIView!) {
        if view != nil {
            overlayView = UIView(frame: UIScreen.main.bounds)
            overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.45)
            
            activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            activityIndicator.center = overlayView.center
            overlayView.addSubview(activityIndicator)
            activityIndicator.startAnimating()
            view.addSubview(overlayView)
            
        }
    }
    
    public func showOverlay(view: UIView!, with Message: String) {
        if view != nil {
            overlayView = UIView(frame: UIScreen.main.bounds)
            overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
            activityIndicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
            activityIndicator.center = overlayView.center
            overlayView.addSubview(activityIndicator)
            
            messageLabel.frame = CGRect(x: 0, y: activityIndicator.frame.origin.y + 50, width: self.overlayView.frame.size.width, height: 40)
            messageLabel.backgroundColor = UIColor.clear
            messageLabel.textAlignment = .center
            //messageLabel.font = Theme.textStyle.bigBodySemiBold.font
            messageLabel.textColor = UIColor.white
            messageLabel.isHidden = true
            
            if Message.count > 0 {
                messageLabel.text = Message
                messageLabel.isHidden = false
            }
            
            overlayView.addSubview(messageLabel)
            activityIndicator.startAnimating()
            view.addSubview(overlayView)
        }
    }
    
    public func hideOverlayView() {
        overlayView.removeFromSuperview()
        activityIndicator.stopAnimating()
        messageLabel.removeFromSuperview()
        
    }

}
