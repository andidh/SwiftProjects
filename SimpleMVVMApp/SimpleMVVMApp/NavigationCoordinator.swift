//
//  NavigationCoordinator.swift
//  SimpleMVVMApp
//
//  Created by Dehelean Andrei on 3/4/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import Foundation
import UIKit

struct NavigationCoordinator {
    
    fileprivate let navigationController: UINavigationController!
    
    init(withNavigationController navController: UINavigationController) {
        navigationController = navController
    }
    
    func start() {
        showHome()
    }
    
    fileprivate func showHome() {
        var viewModel = HomeViewModel()
        viewModel.didSelectImageCell = showImageController
        viewModel.didSelectTextCell = showTextController
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeController") as! HomeController
        homeVC.viewModel = viewModel
        navigationController.pushViewController(homeVC, animated: true)
    }
    
    fileprivate func showImageController(_ value: String) {
        let imageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ImageController") as! ImageController
        let viewModel = ImageControllerModel(imageName: value)
        imageVC.viewModel = viewModel
        self.navigationController.pushViewController(imageVC, animated: true)
    }
    
    fileprivate func showTextController(_ value: String) {
        let textVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TextController") as! TextController
        let viewModel = TextControllerModel(articleText: value)
        textVC.model = viewModel
        self.navigationController.pushViewController(textVC, animated: true)
    }
}
