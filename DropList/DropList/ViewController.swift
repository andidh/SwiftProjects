//
//  ViewController.swift
//  DropList
//
//  Created by Dehelean Andrei on 3/3/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    fileprivate let days = ["Sunday", "Monday", "Tuesday", "Wednesday","Thursday", "Firday", "Saturday"]
    fileprivate var options = [0,0,0,0,0,0,0]
    
    fileprivate var firstMenuExpanded = false
    fileprivate var secondMenuExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    fileprivate func showFirstMenu() {
        firstMenuExpanded = !firstMenuExpanded
        
        tableView.beginUpdates()
        
        let newIndex = IndexPath(row: 1, section: 0)
        
        tableView.insertRows(at: [newIndex], with: .fade)
        
        tableView.endUpdates()
        
    }
    
    fileprivate func hideFirstMenu() {
        firstMenuExpanded = !firstMenuExpanded
        
        tableView.beginUpdates()
        
        let oldIndex = IndexPath(row: 1, section: 0)
        
        tableView.deleteRows(at: [oldIndex], with: .fade)
        tableView.endUpdates()
    }
    
    fileprivate func showSecondMenu() {
        
        for (index, _) in days.enumerated() {
            indexes.append(IndexPath(row: index + 1, section: 0))
        }
        
        tableView.insertRows(at: indexes, with: .fade)
        tableView.endUpdates()

    }
    
    fileprivate func hideSecondMenu() {
        
    }

}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isMenuShown ? 7 + 2 : 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0 ) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCellId", for: indexPath) as! MenuCell
            cell.titleLabel.text = "Choose your days of the week"
            return cell
        } else if ((indexPath.row == 1 && !isMenuShown) || indexPath.row == 8) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "menuCellId", for: indexPath) as! MenuCell
            cell.titleLabel.text = "You are the best"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "dropCellId", for: indexPath) as! DropCell
            cell.titleLabel.text = days[indexPath.row - 1]
            cell.switchCell.tag = indexPath.row
            cell.switchCell.isOn = options[indexPath.row - 1] == 1;
            cell.delegate = self
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if (indexPath.row == 0) {
            if (!isMenuShown) {
                showMenu()
            } else {
                hideMenu()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if ((indexPath.row == 1 && !isMenuShown) || indexPath.row == 8 || indexPath.row == 0) {
            return 64
        }
        return 44
    }
}

extension ViewController : DropCellDelegate {
    
    func switchChanged(value: Bool, forCellAtRow row: Int) {
        if (value) {
            options[row - 1] = 1
        } else {
            options[row - 1] = 0
        }
    }
}



