//
//  ImageCollectionCell.swift
//  ProductDetailPage
//
//  Created by Dehelean Andrei on 2/26/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class ImageCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var picture: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.picture.layer.cornerRadius = 5
        self.picture.layer.masksToBounds = true
    }
}
