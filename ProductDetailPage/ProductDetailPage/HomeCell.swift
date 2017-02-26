//
//  HomeCell.swift
//  ProductDetailPage
//
//  Created by Dehelean Andrei on 2/26/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

final class HomeCell: UITableViewCell {

    @IBOutlet fileprivate weak var productImage: UIImageView!
    @IBOutlet fileprivate weak var productName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withProduct product: Product) {
        self.productImage.image = UIImage(named: product.productImage)
        self.productName.text = product.name
    }


}
