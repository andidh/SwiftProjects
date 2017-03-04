//
//  MenuCellModel.swift
//  DropMenuMVVM
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

struct MenuCellModel {
    
    let displayTitle: String
    let cellTag: Int
    
    init(withTitle title: String, tag: Int) {
        displayTitle = title
        cellTag = tag
    }
    
    var didSelectCell: ((Int) -> Void)?
    
}

extension MenuCellModel : CellRepresentable {
    
    static func registerCell(forTableView tv: UITableView) {
        let nib = UINib(nibName: "MenuCell", bundle: nil)
        tv.register(nib, forCellReuseIdentifier: MenuCell.cellId)
    }
    
    func cellInstance(forTableView tv: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: MenuCell.cellId, for: indexPath) as! MenuCell
        cell.configure(withModel: self)
        return cell
    }
    
    func cellSelected() {
        didSelectCell?(cellTag)
    }
}


