//
//  DropCell.swift
//  DropMenuMVVM
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class DropCell: UITableViewCell {

    static let cellId = "DropCellId"
    
    var viewModel: DropCellModel?

    @IBOutlet weak var dropTitleLabel: UILabel!
    @IBOutlet weak var dropSwitch: UISwitch!
    
    func configureCell(withModel model: DropCellModel) {
        self.viewModel = model
        dropTitleLabel.text = model.displayTitle
        dropSwitch.isOn = model.isSwitchOn
    }
    
    @IBAction func switchValuechanged(_ sender: Any) {
        self.viewModel?.cellSelected()
    }
}
