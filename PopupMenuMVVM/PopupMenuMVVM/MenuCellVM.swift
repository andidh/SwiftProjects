//
//  MenuCellVM.swift
//  PopupMenuMVVM
//
//  Created by Dehelean Andrei on 3/5/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit


class MenuCellVM {
    
    // values to populate the cell
    let displayTitle: Dynamic<String>
    
    // identifying the cell
    let tag: Int
    
    init(withTitle title: String, tag: Int) {
        self.displayTitle = Dynamic(title)
        self.tag = tag
    }
    
    // events
    var didSelect: ((Int) -> Void)?
    
}


extension MenuCellVM : CellRepresentable {
    
    static func registerCell(forTV tv: UITableView) {
        let nib = UINib(nibName: "MenuCell", bundle: nil)
        tv.register(nib, forCellReuseIdentifier: "MenuCellId")
    }
    
    func cellInstance(forTableView tv: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "MenuCellId", for: indexPath) as! MenuCell
        cell.viewModel = self
        return cell
    }
    
    func cellSelected() {
        didSelect?(tag)
    }
}
