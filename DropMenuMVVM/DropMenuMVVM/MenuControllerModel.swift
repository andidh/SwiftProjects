//
//  MenuControllerModel.swift
//  DropMenuMVVM
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class MenuControllerModel {
    
    
    let tableCellsTypes: [CellRepresentable.Type] = [MenuCellModel.self, DropCellModel.self]
    var tableCells = [CellRepresentable]()
    var isMenuExpanded: Bool = false
    
    var didUpdate: (() -> Void)?
    var didInsert: (([Int]) -> Void)?
    var didRemove: (([Int]) -> Void)?
    var didSelectDropCell: ((Int) -> Void)?
    
    func initData() {
        tableCells = [menuCellModel("Select an option", tag: 0)]
        didUpdate?()
    }
    
    fileprivate func menuCellModel(_ title: String, tag: Int) -> MenuCellModel {
        var instance = MenuCellModel(withTitle: title, tag: tag)
        instance.didSelectCell = { self.selectMenuCell(withTag: $0)}
        return instance
    }
    
    fileprivate func dropCellModel(_ title: String, tag: Int, switchOn: Bool) -> DropCellModel {
        var instance = DropCellModel(withTitle: title, tag: tag, switchOn: switchOn)
        instance.didSelectCell = { self.didSelectDropCell?($0)}
        return instance
    }
    
    func selectMenuCell(withTag tag: Int) {
        if (isMenuExpanded) {
            removeOptions(forMenuAtIndex: tag)
        } else {
            insertOptions(forMenuAtIndex: tag)
        }
        isMenuExpanded = !isMenuExpanded

    }
    
    func insertOptions(forMenuAtIndex index: Int) {
        if (index == 0) {
            tableCells.append( dropCellModel("First option", tag: 1, switchOn: false))
            tableCells.append( dropCellModel("Second option", tag: 2, switchOn: true))
        }
        
        didInsert?([1,2])
    }
    
    func removeOptions(forMenuAtIndex index: Int) {
        if (index == 0) {
            tableCells.remove(at: 2)
            tableCells.remove(at: 1)
        }
        
        didRemove?([1,2])
    }
    
}

/*
 dropCellModel("First option", tag: 1, switchOn: false),
 dropCellModel("Second option", tag: 2, switchOn: true),
 dropCellModel("Third option", tag: 3, switchOn: false))
 */
