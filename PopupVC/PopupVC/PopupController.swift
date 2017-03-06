//
//  PopupController.swift
//  PopupVC
//
//  Created by Dehelean Andrei on 3/6/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class PopupController: UIViewController {

    
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    convenience init() {
        self.init(nibName:"PopupController", bundle: nil)
        
        transitioningDelegate = self
        modalPresentationStyle = .custom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layer.cornerRadius = 10
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissController))
        tap.cancelsTouchesInView = false
        tap.delegate = self
        self.view.addGestureRecognizer(tap)
        
    }

    @IBAction func changeHeight(_ sender: Any) {
        let center = self.view.center
        UIView.animate(withDuration: 0.3) { 
            self.popupView.frame.size.height = 500
            self.popupView.center = center
        }
    }
    
    
    @objc fileprivate func dismissController() {
        dismiss(animated: true, completion: nil)
    }
}


extension PopupController: UIViewControllerTransitioningDelegate {
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        return DimmingPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeOutAnimation()
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PopupAnimationController()
    }
}

extension PopupController: UIGestureRecognizerDelegate {
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        return touch.view == self.view
    }
}
