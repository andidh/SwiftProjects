//
//  HomeController.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        self.tableView.rowHeight = 64
        
        //registering the cells based on the info from view model
        let _ = self.viewModel.tableCellTypes.map { $0.registerCell(forTableView: self.tableView) }
        self.viewModel.didUpdate = { [unowned self] in
            self.tableView.reloadData()
        }
        
        self.viewModel.refreshData()
    }
    
}


extension HomeController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = self.viewModel.tableCells[indexPath.row]
        return cellViewModel.cellInstance(forTableView: tableView, withIndexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cellModel = self.viewModel.tableCells[indexPath.row]
        cellModel.cellSelected()
    }
    
}
