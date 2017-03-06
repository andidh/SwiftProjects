//
//  FadeOutAnimation.swift
//  PopupVC
//
//  Created by Dehelean Andrei on 3/6/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class FadeOutAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let fromView = transitionContext.view(forKey: .from) {
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { 
                fromView.alpha = 0
            }, completion: { success in
                transitionContext.completeTransition(success)
            })
        }
    }
    
}
