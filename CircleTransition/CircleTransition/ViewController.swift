//
//  ViewController.swift
//  CircleTransition
//
//  Created by Dehelean Andrei on 2/28/17.
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func menuButtonTapped(_ sender: Any) {
        
        print("it works")
    }

}

