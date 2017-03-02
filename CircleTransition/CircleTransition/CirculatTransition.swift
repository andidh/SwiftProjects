//
//  CirculatTransition.swift
//  CircleTransition
//
//  Created by Dehelean Andrei on 3/2/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

final class CircularTransition: NSObject {
    
    var circle = UIView()
    
    var startingPoint = CGPoint.zero {
        didSet {
            circle.center = startingPoint
        }
    }
    
    var circleColor: UIColor!
    
    enum CircularTransitionMode: Int {
        case present, dismiss, pop
    }
    
    var currentMode: CircularTransitionMode = .present
}


extension CircularTransition: UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        if (currentMode == .present) {
            if let presentedView = transitionContext.view(forKey: .to) {
                let viewCenter = presentedView.center
                let viewSize = presentedView.frame.size
                
                circle = UIView()
                
                circle.frame = frameForCircle(withSize: viewSize, startPoint: startingPoint)
                circle.center = startingPoint
                circle.layer.cornerRadius = circle.frame.width / 2
                circle.backgroundColor = circleColor
                circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                containerView.addSubview(circle)
                
                presentedView.center = startingPoint
                presentedView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                presentedView.alpha = 0.0
                containerView.addSubview(presentedView)
                
                UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { 
                    self.circle.transform = .identity
                    presentedView.transform = .identity
                    presentedView.alpha = 1.0
                    presentedView.center = viewCenter
                }, completion: { success in
                    transitionContext.completeTransition(success)
                })
            }
        } else {
            let transitionModeKey = self.currentMode == .pop ? UITransitionContextViewKey.to : UITransitionContextViewKey.from
            
            if let returningView = transitionContext.view(forKey: transitionModeKey) {
                let viewCenter = returningView.center
                let viewSize = returningView.frame.size
                
                circle.frame = frameForCircle(withSize: viewSize, startPoint: startingPoint)
                circle.layer.cornerRadius = circle.frame.width / 2
                circle.center = startingPoint
                
                UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: { 
                    self.circle.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
                    returningView.center = self.startingPoint
                    returningView.alpha = 0.0
                    
                    if self.currentMode == .pop {
                        containerView.insertSubview(returningView, belowSubview: returningView)
                        containerView.insertSubview(self.circle, belowSubview: returningView)
                    }
                }, completion: { success in
                    returningView.center = viewCenter
                    returningView.removeFromSuperview()
                    
                    self.circle.removeFromSuperview()
                    
                    transitionContext.completeTransition(success)
                })
            }
        }
    }
    
    
    fileprivate func frameForCircle(withSize size: CGSize, startPoint: CGPoint) -> CGRect {
        let xLen = fmax(startingPoint.x, size.width - startingPoint.x)
        let yLen = fmax(startingPoint.y, size.width - startingPoint.y)
        
        let radius = sqrt(xLen * xLen + yLen * yLen) * 3
        let newSize = CGSize(width: radius, height: radius)
        
        return CGRect(origin: CGPoint.zero, size: newSize)
    }
}
