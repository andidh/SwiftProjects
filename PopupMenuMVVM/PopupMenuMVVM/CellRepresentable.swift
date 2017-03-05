//
//  CellRepresentable.swift
//  PopupMenuMVVM
//
//  Created by Dehelean Andrei on 3/5/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit


protocol CellRepresentable {
    
    static func registerCell(forTV tv: UITableView)
    func cellInstance(forTableView tv: UITableView, indexPath: IndexPath) -> UITableViewCell
    func cellSelected()
}
