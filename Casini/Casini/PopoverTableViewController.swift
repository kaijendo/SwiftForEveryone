//
//  PopoverTableViewController.swift
//  Casini
//
//  Created by Thuy Truong Quang on 12/6/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class PopoverTableViewController: UITableViewController {
    // MARK: - Properties
    /// Variable
    var optionSelected = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 150, height: 270)
        tableView.isScrollEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: true, completion: nil)
        optionSelected = indexPath.row
        self.performSegue(withIdentifier: "toMasterView", sender: self)
    }
    
    /// Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toMasterView" {
            let masterVC = segue.destination as! MasterTableViewController
                masterVC.sortOption = optionSelected
        }
    }
}
