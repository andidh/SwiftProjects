//
//  ImageCellModel.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

struct ImageCellModel {
    
    let imageName: String
    
    init(withImageName name: String) {
        imageName = name
    }
    
    var didSelectCell: ((String) -> Void)?
}


extension ImageCellModel : CellType {
    func cellSelected() {
        didSelectCell?(imageName)
    }
    
    func cellInstance(forTableView tv: UITableView, withIndexPath index: IndexPath) -> UITableViewCell {
        let cell = tv.dequeueReusableCell(withIdentifier: "ImageCellId", for: index) as! ImageCell
        cell.configure(withModel: self)
        return cell
    }
    
    static func registerCell(forTableView tv: UITableView) {
        let nib = UINib(nibName: "ImageCell", bundle: nil)
        tv.register(nib, forCellReuseIdentifier: "ImageCellId")
    }
}
