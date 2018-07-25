//
//  ViewController.swift
//  CustomTableViewLoad
//
//  Created by Thuy Truong Quang on 7/25/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    var customTableViewLoader: CustomTableViewLoad!
    let identifierCell = "IdentifierCell"
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }
    // MARK: - Functions
    fileprivate func prepareUI() {
        customTableViewLoader = CustomTableViewLoad(tableView: tableView, cellIdentifier: identifierCell, sourceViewController: self, heightCell: 100)
        tableView.tableFooterView = UIView.init()
        customTableViewLoader.startAnimation()
        self.handleDataFromSevices()
    }
    override func configrationEmpty(_ cell: UITableViewCell, at indexPath: IndexPath) {
        super.configrationEmpty(cell, at: indexPath)
        
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath) as! CustomTableViewCell
        cell.configuaration()
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController {
    @objc func handleDataFromSevices() {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { (_ ) in
            self.customTableViewLoader.stopAnimation()
            self.tableView.reloadData()
        }
    }
}
