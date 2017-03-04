//
//  MenuCell.swift
//  DropMenuMVVM
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    static let cellId = "MenuCellId"

    @IBOutlet weak var menuTitleLabel: UILabel!
    
    func configure(withModel model: MenuCellModel) {
        menuTitleLabel.text = model.displayTitle
    }
    
    
}
