//
//  PopupAnimation.swift
//  PopupVC
//
//  Created by Dehelean Andrei on 3/6/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class PopupAnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let toViewController = transitionContext.viewController(forKey: .to), let toView = transitionContext.view(forKey: .to)  {
            let containerView = transitionContext.containerView
            toView.frame = transitionContext.finalFrame(for: toViewController)
            toView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { 
                containerView.addSubview(toView)
                toView.transform = .identity
            }, completion: { success in
                transitionContext.completeTransition(success)
            })
            
        }
    }
}
