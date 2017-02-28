//
//  MainViewController.swift
//  StretchyHeader+Slideshow
//
//  Created by Dehelean Andrei on 2/28/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

struct Product {
    let name: String
    var images: [String]
    let details: String
    
    mutating func add(image: String) {
        images.append(image)
    }
}


final class MainViewController: UIViewController {
    
    fileprivate var product: Product = Product(name: "Macbook", images: ["ig1", "ig2", "ig3", "ig4", "ig5", "ig6"], details: "It’s faster and more powerful than before, yet remarkably thinner and lighter. It has the brightest, most colorful Mac notebook display ever. And it introduces the Touch Bar — a Multi-Touch enabled strip of glass built into the keyboard for instant access to the tools you want, right when you want them. The new MacBook Pro is built on groundbreaking ideas. And it’s ready for yours.It’s faster and more powerful than before, yet remarkably thinner and lighter. It has the brightest, most colorful Mac notebook display ever. And it introduces the Touch Bar — a Multi-Touch enabled strip of glass built into the keyboard for instant access to the tools you want, right when you want them. The new MacBook Pro is built on groundbreaking ideas. And it’s ready for yours." )

    fileprivate let headerHeight: CGFloat = 300.0
    fileprivate var headerView: StretchyHeaderView!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        headerView = tableView.tableHeaderView as! StretchyHeaderView
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 30))
        tableView.addSubview(headerView)
        headerView.picture.image = UIImage(named: (product.images.first)!)
        
        tableView.contentInset = UIEdgeInsetsMake(headerHeight, 0, 0, 0)
        tableView.contentOffset = CGPoint(x: 0, y: -headerHeight)
        
        updateHeaderView()
    }
    
    fileprivate func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -headerHeight, width: self.view.bounds.width, height: headerHeight)
        if (tableView.contentOffset.y < -headerHeight) {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerView.frame = headerRect
    }
    
}

extension MainViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "slideshowCellId", for: indexPath) as! SlideshowCell
        
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
        
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "productDetailsCellId", for: indexPath) as! ProductDetailsCell
            cell.detailsLabel.text = product.details
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 80 : 250
    }
    
}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return product.images.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (indexPath.item == 0) {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "addItemCellId", for: indexPath)
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCollectionCell", for: indexPath) as! FullImageCell
            
            let image = UIImage(named: product.images[indexPath.row - 1])
            cell.picture.image = image
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if (indexPath.item == 0) {
            
        } else {
            headerView.picture.image = UIImage(named: product.images[indexPath.row - 1])
        }
    }
    
    
    
}

