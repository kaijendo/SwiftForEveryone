//
//  MasterTableViewController.swift
//  Casini
//
//  Created by Thuy Truong Quang on 12/6/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

enum SortType: Int {
    case year = 0
    case month = 1
    case day = 2
    case hour = 3
    case minute = 4
    case second = 5
    //case total
    //    func getTitle() -> String {
    //        switch self {
    //        case .year:
    //            <#code#>
    //        default:
    //            <#code#>
    //        }
    //    }
}
class MasterTableViewController: UITableViewController {
    // MARK: - Properties
    /// Variable
    var dateObject = [Date]()
    var sortOption = -1
    /// Outlets
    @IBOutlet var nodataView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightNav = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.done, target: self, action: #selector(addNew))
        self.navigationItem.rightBarButtonItem = rightNav
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.seupView()
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
        self.seupView()
    }
    
    fileprivate func analysisDate(date: Date) -> (Int, Int, Int, Int, Int, Int) {
        let day = Calendar.autoupdatingCurrent.component(.day, from: date)
        let month = Calendar.autoupdatingCurrent.component(.month, from: date)
        let year = Calendar.autoupdatingCurrent.component(.year, from: date)
        let hour = Calendar.autoupdatingCurrent.component(.hour, from: date)
        let minute = Calendar.autoupdatingCurrent.component(.minute, from: date)
        let second = Calendar.autoupdatingCurrent.component(.second, from: date)
        return (day, month, year, hour, minute, second)
    }
    fileprivate func seupView() {
        if dateObject.count == 0 {
            self.tableView.backgroundView = nodataView
            self.tableView.isScrollEnabled = false
        }
        else {
            self.tableView.isScrollEnabled = true
            self.tableView.backgroundView = nil
        }
    }
    fileprivate func sortOptions(sortType: SortType) {
        switch sortType {
        case .year:
            dateObject.sort { analysisDate(date: $0).0 < analysisDate(date: $1).0 }
            return
        case .month:
            dateObject.sort { analysisDate(date: $0).1 < analysisDate(date: $1).1 }
            return
        case .day:
            dateObject.sort { analysisDate(date: $0).2 < analysisDate(date: $1).2 }
            return
        case .hour:
            dateObject.sort { analysisDate(date: $0).3 < analysisDate(date: $1).3 }
            return
        case .minute:
            dateObject.sort { analysisDate(date: $0).4 < analysisDate(date: $1).4 }
            return
        case .second:
            dateObject.sort { analysisDate(date: $0).5 < analysisDate(date: $1).5 }
            return
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.dateObject.count > 0 {
            return dateObject.count
        } else {
            self.seupView()
            return 0
        }
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
            self.sortOptions(sortType: SortType(rawValue: sortOption)!)
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
