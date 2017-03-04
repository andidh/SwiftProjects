//
//  AlertView.swift
//  CustomAlertView
//
//  Created by Dehelean Andrei on 3/2/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class AlertView: UIView {

    
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("init")
    }    
}
