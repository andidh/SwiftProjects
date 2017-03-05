//
//  MenuVW.swift
//  PopupMenuMVVM
//
//  Created by Dehelean Andrei on 3/5/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit


class MenuVM {
    
    let firstMenuDefault = 0
    let secondMenuDefault = 1
    let secondMenuWhenFirstExpanded = 3
    let firstMenuOptionOne = 1
    let firstMenuOptionTwo = 2
    let secondMenuOptionOneDefault = 2
    let secondMenuOptionTwoDefault = 3
    let secondMenuOptionOneExpanded = 4
    let secondMenuOptionTwoExpanded = 5
    
    
    
    // private properties
    var firstMenuExpanded = false
    var secondMenuExpanded = false
    
    // all types of cells displayed by the VC -> for registering the cells
    let tableCellTypes: [CellRepresentable.Type]  = [MenuCellVM.self]
    
    // all cells of the VC -> for populating
    var tableCells: [CellRepresentable] = [CellRepresentable]()
    
    // output event
    var didUpdate: (() -> Void)?
    var didInsert: (([Int]) -> Void)?
    var didDelete: (([Int]) -> Void)?
    
    func initData() {
        tableCells = [menuCellViewModel("First menu", tag: firstMenuDefault),
                      menuCellViewModel("Second menu", tag: secondMenuDefault)
                    ]
        
        didUpdate?()
    }
    
    
    
    fileprivate func menuCellViewModel(_ title: String, tag: Int) -> MenuCellVM {
        let instance = MenuCellVM(withTitle: title, tag: tag)
        instance.didSelect = menuCellSelected
        return instance
    }
    
    
    fileprivate func menuCellSelected(_ tag: Int) {
        if (tag == 0 && !firstMenuExpanded) {
            if (secondMenuExpanded) {
                hideMenu(1)
            }
            expandMenu(tag)
        } else if (tag == 0 && firstMenuExpanded) {
            hideMenu(tag)
        } else if (tag == 1 && !secondMenuExpanded) {
            if (firstMenuExpanded) {
                hideMenu(0)
            }
            expandMenu(tag)
        } else if (tag == 1 && secondMenuExpanded) {
            hideMenu(tag)
        }
    }
    
    fileprivate func expandMenu(_ tag: Int) {
        if (tag == 0) {
            firstMenuExpanded = !firstMenuExpanded
            
            tableCells.insert(menuCellViewModel("First option", tag: 2), at: firstMenuOptionOne)
            tableCells.insert(menuCellViewModel("Second option", tag: 3), at: firstMenuOptionTwo)
            
            didInsert?([1,2])
        } else if (tag == 1) {
            secondMenuExpanded = !secondMenuExpanded
            
            tableCells.insert(menuCellViewModel("Third option", tag: 4), at: secondMenuOptionOneDefault)
            tableCells.insert(menuCellViewModel("Forth option", tag: 5), at: secondMenuOptionTwoDefault)
            
            didInsert?([2,3])
        }
    }
    
    fileprivate func hideMenu(_ tag: Int) {
        if (tag == 0) {
            firstMenuExpanded = !firstMenuExpanded
            
            tableCells.remove(at: 1)
            tableCells.remove(at: 2)
            
            didDelete?([1,2])
        } else if (tag == 1) {
            secondMenuExpanded = !secondMenuExpanded
            
            tableCells.remove(at: secondMenuOptionOneDefault)
            tableCells.remove(at: secondMenuOptionTwoDefault)
            
            didDelete?([2,3])
        }

    }
    
    
}
