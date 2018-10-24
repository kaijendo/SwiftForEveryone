//
//  ViewController.swift
//  ResueTableViewDataSource
//
//  Created by Thuy Truong Quang on 10/3/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var data = [0,1,2,3,4,5,6,7,8,9]
    var dataSource: UITableViewDataSource?
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = TableViewDataSource.make(data: data)
        tableView.dataSource = dataSource
        
    }
}

extension TableViewDataSource where Model == Int {
    static func make(data: [Int], cellIdentifer: String = "Cell") -> UITableViewDataSource {
       return TableViewDataSource(data: data, identifierCell: cellIdentifer) { (item, cell) in
            cell.textLabel?.text = "\(item)"
        }
    }
}

