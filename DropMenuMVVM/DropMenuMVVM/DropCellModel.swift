//
//  DropCellModel.swift
//  DropMenuMVVM
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

struct DropCellModel {
    
    // MARK: - Properties
    let cellTag: Int
    let displayTitle: String
    var isSwitchOn: Bool
    
    init(withTitle title: String, tag: Int, switchOn: Bool) {
        displayTitle = title
        cellTag = tag
        isSwitchOn = switchOn
    }
    
    
    // MARK: - Events
    var didSelectCell: ((Int) -> Void)?
}

extension DropCellModel : CellRepresentable {
    
    static func registerCell(forTableView tv: UITableView) {
        let nib = UINib(nibName: "DropCell", bundle: nil)
        tv.register(nib, forCellReuseIdentifier: DropCell.cellId)
    }
    
    func cellInstance(forTableView tv: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: DropCell.cellId, for: indexPath) as! DropCell
        cell.configureCell(withModel: self)
        return cell
    }
    
    mutating func cellSelected() {
        isSwitchOn = !isSwitchOn
        didSelectCell?(cellTag)
    }
    
    
}
