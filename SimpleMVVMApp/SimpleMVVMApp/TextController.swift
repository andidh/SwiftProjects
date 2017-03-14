//
//  TextController.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class TextController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    var model: TextControllerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Text Controller"
        self.textLabel.text = model?.articleText
    }

}
