//
//  ViewController.swift
//  ResuseDataSource
//
//  Created by Thuy Truong Quang on 10/3/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /*
     Examp1: TableView using data of muplite arrays.
     */
    var data = [
        [0,1,2,3,4,5],
        [6,7,8,9]
    ]
    
    /*
     Examp2: TableView using data of array.
     */
    
    
    var dataSimple = [10, 11, 12, 13, 14, 15]
    var dataSources: SectionedTableViewDataSource?
    var dataSource: UITableViewDataSource?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        tableView.delegate = self
        
    }
    func loadData() {
        dataSources = SectionedTableViewDataSource(dataSources: preapareTableViewDataSource(data: data))
        
        dataSource = TableViewDataSource.make(for: dataSimple)
        tableView.dataSource = dataSource
    }
    
    func preapareTableViewDataSource(data: [[Int]]) -> [UITableViewDataSource] {
        var dataSources: [UITableViewDataSource] = []
        data.forEach { (item) in
            let dataSource = TableViewDataSource.make(for: item)
            dataSources.append(dataSource)
        }
        return dataSources
    }
}

// MARK: - UITableViewDataSource
extension TableViewDataSource where Model == Int {
    static func make(for data: [Int], cellIdentifier: String = "Cell") -> TableViewDataSource {
        return TableViewDataSource(models: data, cellIdentifier: cellIdentifier, cellConfiguration: { (item, cell) in
            cell.textLabel?.text = "\(item)"
        })
    }
}

// MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Section: \(indexPath.section), row: \(indexPath.row)")
    }
}

