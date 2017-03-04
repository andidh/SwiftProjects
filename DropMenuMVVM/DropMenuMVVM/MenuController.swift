//
//  MenuController.swift
//  DropMenuMVVM
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class MenuController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MenuControllerModel!
    
    convenience init(withModel model: MenuControllerModel) {
        self.init(nibName: "MenuController", bundle: nil)
        self.viewModel = model
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 64
        let _ = viewModel.tableCellsTypes.map { $0.registerCell(forTableView: self.tableView)}
        
        viewModel.didUpdate = { [unowned self] in
            self.tableView.reloadData()
        }
        
        viewModel.didInsert = {[unowned self] (values: [Int]) in
            let indexes = values.map { IndexPath(row: $0, section: 0)}
            self.tableView.beginUpdates()
            self.tableView.insertRows(at: indexes, with: .fade)
            self.tableView.endUpdates()
        }
        
        viewModel.didRemove = {[unowned self] (values: [Int]) in
            let indexes = values.map { IndexPath(row: $0, section: 0)}
            self.tableView.beginUpdates()
            self.tableView.deleteRows(at: indexes, with: .fade)
            self.tableView.endUpdates()
        }

        
        viewModel.initData()
    }
    

}

extension MenuController : UITableViewDelegate, UITableViewDataSource {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = viewModel.tableCells[indexPath.row]
        return cellModel.cellInstance(forTableView: tableView, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cellModel = viewModel.tableCells[indexPath.row]
        cellModel.cellSelected()
    }
    
    
}
