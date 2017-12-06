//
//  MasterTableViewController.swift
//  Casini
//
//  Created by Thuy Truong Quang on 12/6/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
    // MARK: - Properties
    /// Variable
    var dateObject = [Date]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightNav = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.done, target: self, action: #selector(addNew))
        self.navigationItem.rightBarButtonItem = rightNav
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Function
    @objc fileprivate func addNew() {
        self.dateObject.insert(Date(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateObject.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(dateObject[indexPath.row])"
        return cell
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.dateObject.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Update" {
            let detailsVC = (segue.destination as! UINavigationController).topViewController as! DetailsViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                detailsVC.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                detailsVC.navigationItem.leftItemsSupplementBackButton = true
                detailsVC.text = "\(dateObject[indexPath.row])"
            }
        }
        if segue.identifier == "SortOptional" {
            if let sortVC = segue.destination as? PopoverTableViewController {
                sortVC.modalPresentationStyle = .popover
                sortVC.popoverPresentationController?.delegate = self
                sortVC.popoverPresentationController?.sourceView = self.view
            }
        }
    }
}

extension MasterTableViewController: UIPopoverPresentationControllerDelegate{
    func adaptivePresentationStyle(for controller: UIPresentationController)
        -> UIModalPresentationStyle {
            return UIModalPresentationStyle.none
    }
}
