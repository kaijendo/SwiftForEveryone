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
    var sortOption = -1
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
    @objc
    fileprivate func addNew() {
        self.dateObject.insert(Date(), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .fade)
    }
    
    fileprivate func sortOptions(option: Int) {
        switch option {
        case 0:
            dateObject.sort {(first, last) -> Bool in {
                analysisDate(date: first).0 < analysisDate(date: last).0
                }()
            }
            return
        case 1:
            dateObject.sort {(first, last) -> Bool in {
                analysisDate(date: first).1 < analysisDate(date: last).1
                }()
            }
            return
        case 2:
            dateObject.sort {(first, last) -> Bool in {
                analysisDate(date: first).2 < analysisDate(date: last).2
                }()
            }
            return
        case 3:
            dateObject.sort {(first, last) -> Bool in {
                analysisDate(date: first).3 < analysisDate(date: last).3
                }()
            }
            return
        case 4:
            dateObject.sort {(first, last) -> Bool in {
                analysisDate(date: first).4 < analysisDate(date: last).4
                }()
            }
            return
        case 5:
            dateObject.sort {(first, last) -> Bool in {
                analysisDate(date: first).5 < analysisDate(date: last).5
                }()
            }
            return
        default:
            return
        }
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
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Update" {
            let detailsVC = (segue.destination as! UINavigationController).topViewController as! DetailsViewController
            if let indexPath = tableView.indexPathForSelectedRow {
                detailsVC.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                detailsVC.navigationItem.leftItemsSupplementBackButton = true
                detailsVC.text = "\(dateObject[indexPath.row])"
            }
        }
        if segue.identifier == "toSortOptions" {
            if let sortVC = segue.destination as? PopoverTableViewController {
                sortVC.modalPresentationStyle = .popover
                sortVC.popoverPresentationController?.delegate = self
                sortVC.popoverPresentationController?.sourceView = self.view
                
            }
        }
    }
    @IBAction func unwindToMasterVC(for segue: UIStoryboardSegue) {
        if segue.source is PopoverTableViewController {
            self.sortOptions(option: sortOption)
            self.tableView.reloadData()
        }
    }
}

extension MasterTableViewController: UIPopoverPresentationControllerDelegate{
    func adaptivePresentationStyle(for controller: UIPresentationController)
        -> UIModalPresentationStyle {
            return UIModalPresentationStyle.none
    }
}

extension MasterTableViewController {
    fileprivate func analysisDate(date: Date) -> (Int, Int, Int, Int, Int, Int) {
        let day = Calendar.autoupdatingCurrent.component(.day, from: date)
        let month = Calendar.autoupdatingCurrent.component(.month, from: date)
        let year = Calendar.autoupdatingCurrent.component(.year, from: date)
        let hour = Calendar.autoupdatingCurrent.component(.hour, from: date)
        let minute = Calendar.autoupdatingCurrent.component(.minute, from: date)
        let second = Calendar.autoupdatingCurrent.component(.second, from: date)
        return (day, month, year, hour, minute, second)
    }
}
