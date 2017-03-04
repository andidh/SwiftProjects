//
//  TextCellModel.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

struct TextCellModel {
    
    fileprivate let rawText: String
    fileprivate let itemId: Int
    let displayValue: String
    
    // MARK: - Events
    var didSelectCell: ((Int) -> Void)?
    
    init(withText text: String, id: Int) {
        rawText = text
        displayValue = text
        itemId = id
    }
    
}

extension TextCellModel : CellType {
    static func registerCell(forTableView tv: UITableView) {
        let nib = UINib(nibName: "TextCell", bundle: nil)
        tv.register(nib, forCellReuseIdentifier: "TextCellId")
    }
    
    func cellInstance(forTableView tv: UITableView, withIndexPath index: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "TextCellId", for: index) as! TextCell
        cell.configure(withModel: self)
        return cell
    }
    
    func cellSelected() {
        didSelectCell?(itemId)
    }
}
