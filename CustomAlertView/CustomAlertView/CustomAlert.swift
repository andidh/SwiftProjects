//
//  CustomAlert.swift
//  CustomAlertView
//
//  Created by Dehelean Andrei on 3/2/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

final class CustomAlert {
    
    static let shared = CustomAlert()
    
    private init() {}
    
    func presentAlert(onView view: UIView, withMessage message: String, completionHandlers: [() -> Void]) {
        
        let alertView = UINib(nibName: "AlertView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! AlertView
        alertView.frame = CGRect(x: 0, y: 0, width: 270, height: 140)
        alertView.center = view.center
        alertView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        alertView.alpha = 0.0
        view.addSubview(alertView)
        completionHandlers[0] += { print("yeey")}
        
        alertView.messageLabel.text = message
        alertView.leftButton.actionHandle(controlEvents: .touchUpInside, forAction: completionHandlers[0])
        alertView.rightButton.actionHandle(controlEvents: .touchUpInside, forAction: completionHandlers[1])
        
        UIView.animate(withDuration: 0.3) { 
            alertView.transform = .identity
            alertView.alpha = 1.0
        }
    }
    
}
