//
//  ViewController.swift
//  SpinnerCustomComponent
//
//  Created by Dehelean Andrei on 3/5/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var isMenuDisplayed = false
    var dimmingView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCellId", for: indexPath)
        cell.textLabel?.text = "Choose days"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.row == 0) {
            presentMenu()
        }
    }
    
    func presentMenu() {
        isMenuDisplayed = true
        
        dimmingView = UIView(frame: tableView.bounds)
        dimmingView?.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        dimmingView?.alpha = 0.0
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissDimmingView))
        dimmingView?.addGestureRecognizer(tap)
            
        tableView.addSubview(dimmingView!)
        
        let view = MenuView(frame: CGRect(x: 0, y: 0, width: 250, height: 132))
        dimmingView?.addSubview(view)
        view.delegate = self
        view.center = tableView.center
        view.center.y -= 100
        view.alpha = 0.0
        view.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.2, animations: {
            self.dimmingView?.alpha = 1.0
            view.alpha = 1.0
            view.transform = .identity
        })

    }
    
    @objc fileprivate func dismissDimmingView() {
        if let dimmingView = dimmingView {
            UIView.animate(withDuration: 0.2, animations: { 
                dimmingView.alpha = 0.0
            }, completion: { success in
                dimmingView.removeFromSuperview()
            })
        }
    }
    
}



extension ViewController : MenuViewDelegate {
    
    func switchChanged(withValue value: Bool, forItem item: Int) {
        print("Item \(item) is \(value)")
    }
}

