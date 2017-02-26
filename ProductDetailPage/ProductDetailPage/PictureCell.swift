//
//  PictureCell.swift
//  ProductDetailPage
//
//  Created by Dehelean Andrei on 2/26/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class PictureCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
