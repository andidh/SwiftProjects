//
//  ImageController.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class ImageController: UIViewController {

    @IBOutlet weak var picture: UIImageView!
    
    var viewModel: ImageControllerModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Image"
        self.picture.image = UIImage(named: (viewModel?.imageName)!)
    }
}
