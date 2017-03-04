//
//  UIButton+Extension.swift
//  CustomAlertView
//
//  Created by Dehelean Andrei on 3/2/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

extension UIButton {
    private func actionHandleBlock(action:(() -> Void)? = nil) {
        struct __ {
            static var action :(() -> Void)?
        }
        if action != nil {
            __.action = action
        } else {
            __.action?()
        }
    }
    
    @objc private func triggerActionHandleBlock() {
        self.actionHandleBlock()
    }
    
    func actionHandle(controlEvents control :UIControlEvents, forAction action:@escaping () -> Void) {
        self.actionHandleBlock(action: action)
        self.addTarget(self, action: #selector(UIButton.triggerActionHandleBlock), for: control)
    }
}
