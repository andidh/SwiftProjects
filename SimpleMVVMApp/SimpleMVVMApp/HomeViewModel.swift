//
//  HomeViewModel.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

func random(min: Int, max: Int) -> Int {
    return Int(arc4random_uniform(UInt32(max + 1)) + UInt32(min))
}

struct HomeViewModel {
    
    let tableCellTypes: [CellType.Type] = [TextCellModel.self, ImageCellModel.self]
    fileprivate(set) var tableCells = [CellType]()
    
    // MARK :- Events
    var didUpdate: (() -> Void)?
    var didSelectTextCell: ((String) -> Void)?
    var didSelectImageCell: ((String) -> Void)?
    
    mutating func refreshData() {
        tableCells = generateData()
        didUpdate?()
    }
    
    fileprivate func generateData() -> [CellType] {
        
        return (0...4).map { value in
            let rand = random(min: 0, max: 1)
            
            if (rand == 0) {
                return textCellViewModel(value)
            } else {
                return imageCellViewModel(value)
            }
        }
    }
    
    fileprivate func textCellViewModel(_ value: Int) -> TextCellModel {
        var instance = TextCellModel(withText: "Cell \(value)", id: value)
        instance.didSelectCell = { self.didSelectTextCell?($0) }
        return instance
    }
    
    fileprivate func imageCellViewModel(_ value: Int) -> ImageCellModel {
        var instance = ImageCellModel(withImageName: "ig\(value)")
        instance.didSelectCell = { self.didSelectImageCell?($0) }
        return instance
    }
    
}
