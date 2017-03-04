//
//  ViewController.swift
//  CustomAlertView
//
//  Created by Dehelean Andrei on 3/2/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func presentAlert(_ sender: Any) {
        CustomAlert.shared.presentAlert(onView: self.view, withMessage: "You are the best programmer!", completionHandlers: [
            {
                print("left button tapped")
            },
            {
                print("right button tapped")
            }
            ])
    }

}

