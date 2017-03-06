//
//  ViewController.swift
//  PopupVC
//
//  Created by Dehelean Andrei on 3/6/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func presentButtonTapped(_ sender: Any) {
        let popup = SecondViewController()
        self.addChildViewController(popup)
        popup.view.frame = CGRect(x: 0, y: 0, width: 300, height: 400)
        popup.view.center = self.view.center
        self.view.addSubview(popup.view)
        popup.didMove(toParentViewController: self)
    }


}

