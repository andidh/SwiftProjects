//
//  TextCell.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var titleText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(withModel model: TextCellModel) {
        self.titleText.text = model.displayValue
    }
    
}
