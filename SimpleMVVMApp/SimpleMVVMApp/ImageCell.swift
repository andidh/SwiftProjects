//
//  ImageCell.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var photo: UIImageView!
    
    func configure(withModel model: ImageCellModel) {
        photo.image = UIImage(named: model.imageName)
    }
}
