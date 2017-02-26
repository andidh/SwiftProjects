//
//  UIImage+Transparent.swift
//  ProductDetailPage
//
//  Created by Dehelean Andrei on 2/26/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import Foundation
import UIKit


extension UIImage {
    
    class func image(withColor color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return image!
    }
    
}
