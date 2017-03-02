//
//  MenuController.swift
//  CircleTransition
//
//  Created by Dehelean Andrei on 3/2/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("heeee")
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
