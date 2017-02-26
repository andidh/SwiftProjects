//
//  ProductViewController.swift
//  ProductDetailPage
//
//  Created by Dehelean Andrei on 2/26/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

final class ProductViewController: UIViewController {
    
    var product: Product?
    
    fileprivate enum CellType : String {
        case image = "pictureCellId"
        case description = "descriptionCellId"
        case showcase = "photosCellId"
        
        init(withIndexPath indexPath: IndexPath) {
            switch (indexPath.section, indexPath.row) {
            case (0, 0): self = .image
            case (0, 1): self = .description
            case (0, 2): self = .showcase
           
            default:
                self = .description
            }
        }
    }

    @IBOutlet fileprivate weak var tabelView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.makeTransparentNavbar()
        self.tabelView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
        self.navigationController?.hidesBarsOnSwipe = true
    }
    
    fileprivate func makeTransparentNavbar() {
        let navbar = self.navigationController?.navigationBar
        let transparentPixel = UIImage.image(withColor: .clear)
        navbar?.setBackgroundImage(transparentPixel, for: .default)
        navbar?.shadowImage = transparentPixel
        navbar?.isTranslucent = true
    }

}

extension ProductViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = CellType(withIndexPath: indexPath)
        
        switch cellType {
        case .image:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! PictureCell
            cell.productImage.image = UIImage(named: (product?.productImage)!)
            return cell
            
        case .description:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! DescriptionCell
            cell.descriptionLabel.text = product?.name
            return cell
            
        case .showcase:
            let cell = tabelView.dequeueReusableCell(withIdentifier: cellType.rawValue, for: indexPath) as! PhotosCell
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellType = CellType(withIndexPath: indexPath)
        switch cellType {
        case .image:
            return 300
            
        case .description:
            return 60
            
        case .showcase:
            return 80
        }
    }
    
}


extension ProductViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (product?.showcaseImages.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCellId", for: indexPath) as! ImageCollectionCell
        cell.picture.image = UIImage(named: (product?.showcaseImages[indexPath.item])!)
        
        return cell
    }
    
}


