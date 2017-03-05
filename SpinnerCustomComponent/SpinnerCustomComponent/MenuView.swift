//
//  MenuView.swift
//  SpinnerCustomComponent
//
//  Created by Dehelean Andrei on 3/5/17.
//  Copyright © 2017 Dehelean Andrei. All rights reserved.
//

import UIKit

protocol MenuViewDelegate {
    func switchChanged(withValue value: Bool, forItem item: Int)
}

class MenuView: UIView {

    @IBOutlet weak var tableView: UITableView!

    var delegate: MenuViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    
    // Performs the initial setup.
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        
        // Auto-layout stuff.
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        
        // Show the view.
        addSubview(view)
        
        let nib = UINib(nibName: "MenuCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "MenuViewCellId")
        tableView.reloadData()
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView {
        let nib = UINib(nibName: "MenuView", bundle: Bundle.main)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
}


extension MenuView : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuViewCellId", for: indexPath) as! MenuCell
        cell.optionLabel.text = "Option \(indexPath.row)"
        cell.cellSwitch.tag = indexPath.row
        cell.delegate = delegate
        return cell
    }
    
}
