//
//  ViewController.swift
//  CircleTransition
//
//  Created by Dehelean Andrei on 2/28/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    
    lazy var transitionObject = CircularTransition()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SearchController
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .custom
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
 
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transitionObject.currentMode = .present
        transitionObject.startingPoint = searchButton.center
        transitionObject.circleColor = searchButton.backgroundColor
        return transitionObject
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transitionObject.currentMode = .dismiss
        transitionObject.startingPoint = searchButton.center
        transitionObject.circleColor = searchButton.backgroundColor
        return transitionObject
    }
}
