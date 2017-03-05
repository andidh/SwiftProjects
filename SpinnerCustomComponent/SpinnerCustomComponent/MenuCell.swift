//
//  MenuCell.swift
//  SpinnerCustomComponent
//
//  Created by Dehelean Andrei on 3/5/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {

    var delegate: MenuViewDelegate?
    
    @IBOutlet weak var cellSwitch: UISwitch!
    @IBOutlet weak var optionLabel: UILabel!
    
    @IBAction func switchChanged(_ sender: Any) {
        let sw = sender as! UISwitch
        delegate?.switchChanged(withValue: sw.isOn, forItem: cellSwitch.tag)
    }
    
}
