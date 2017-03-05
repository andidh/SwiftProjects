//
//  MenuCell.swift
//  PopupMenuMVVM
//
//  Created by Dehelean Andrei on 3/5/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    @IBOutlet weak var menuTitleLabel: UILabel!
    
    // viewModel property
    var viewModel: MenuCellVM? {
        didSet {
            viewModel?.displayTitle.bind({ [unowned self] (value: String) in
                self.menuTitleLabel.text = value
            })
        }
    }
    
}
