//
//  MenuControllerModel.swift
//  DropMenuMVVM
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

/*
    MENU STRUCTURE:
    
    Choose option:
        - option 1
        - option 2
 
    Chose option:
        - option 3
        - option 4
 
 
 
 */


class MenuControllerModel {
    
    
    let tableCellsTypes: [CellRepresentable.Type] = [MenuCellModel.self, DropCellModel.self]
    var tableCells = [CellRepresentable]()
    var isMenuExpanded: Bool = false
    
    var didUpdate: (() -> Void)?
    var didInsert: (([Int]) -> Void)?
    var didRemove: (([Int]) -> Void)?
    
    func initData() {
        tableCells = [menuCellModel("Select an option", tag: 0), menuCellModel("Select last option", tag: 1)]
        didUpdate?()
    }
    
    fileprivate func menuCellModel(_ title: String, tag: Int) -> MenuCellModel {
        var instance = MenuCellModel(withTitle: title, tag: tag)
        instance.didSelectCell = { self.selectMenuCell(withTag: $0)}
        return instance
    }
    
    fileprivate func dropCellModel(_ title: String, tag: Int, switchOn: Bool) -> DropCellModel {
        var instance = DropCellModel(withTitle: title, tag: tag, switchOn: switchOn)
        instance.didSelectCell = { self.selectDropCell(withTag: $0)}
        return instance
    }
    
    func selectDropCell(withTag tag: Int) {
        guard isMenuExpanded else { return }
        
        print("Switch no. \(tag) has changed")
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
            tableCells.insert(dropCellModel("First option", tag: 1, switchOn: false), at: 1)
            tableCells.insert( dropCellModel("Second option", tag: 2, switchOn: true), at: 2)
            
            didInsert?([1,2])
        } else if (index == 1) {
            tableCells.append(dropCellModel("Third option", tag: 2, switchOn: false))
            tableCells.append( dropCellModel("Fourth option", tag: 3, switchOn: true))
            
            didInsert?([2,3])
        }
        
    }
    
    func removeOptions(forMenuAtIndex index: Int) {
        if (index == 0) {
            tableCells.remove(at: 2)
            tableCells.remove(at: 1)
            
            didRemove?([1,2])
        } else if (index == 1) {
            tableCells.remove(at: 3)
            tableCells.remove(at: 2)
            didRemove?([2,3])
        }
        
    }
    
}

/*
 dropCellModel("First option", tag: 1, switchOn: false),
 dropCellModel("Second option", tag: 2, switchOn: true),
 dropCellModel("Third option", tag: 3, switchOn: false))
 */
