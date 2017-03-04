//
//  CellRepresentable.swift
//  DropMenuMVVM
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    
    static func registerCell(forTableView tv: UITableView)
    func cellInstance(forTableView tv: UITableView, indexPath: IndexPath) -> UITableViewCell
    func cellSelected()
    
}
