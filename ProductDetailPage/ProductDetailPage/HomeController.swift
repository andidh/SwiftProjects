//
//  HomeController.swift
//  ProductDetailPage
//
//  Created by Dehelean Andrei on 2/26/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

final class HomeController: UITableViewController {
    
    fileprivate let cellId = "homeCellId"
    
    fileprivate var model: Product = Product(name: "Macbook Pro 2016", productImage: "ig1", showcaseImages: ["ig1", "ig2", "ig3","ig1", "ig2", "ig3","ig1", "ig2", "ig3"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 66
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

}


extension HomeController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! HomeCell
        
        cell.configure(withProduct: model)
        
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductViewController") as! ProductViewController
        
        controller.product = model
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

