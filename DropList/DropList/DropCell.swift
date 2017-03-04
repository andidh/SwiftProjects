//
//  DropCell.swift
//  DropList
//
//  Created by Dehelean Andrei on 3/3/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

protocol DropCellDelegate : class {
    func switchChanged(value: Bool, forCellAtRow row: Int)
}


class DropCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var switchCell: UISwitch!
    
    weak var delegate: DropCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func switchChanged(_ sender: Any) {
        let cellSwitch = sender as! UISwitch
        delegate?.switchChanged(value: cellSwitch.isOn, forCellAtRow: cellSwitch.tag)
        
    }
}
