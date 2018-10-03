//
//  TableViewDataSource.swift
//  ResuseDataSource
//
//  Created by Thuy Truong Quang on 10/3/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<Model>: NSObject, UITableViewDataSource {
    typealias CellConfigurator = (Model, UITableViewCell) -> Void
    
    var models: [Model]
    
    private let cellIdentifier: String
    private let cellConfiguration: CellConfigurator
    
    init(models: [Model], cellIdentifier: String, cellConfiguration: @escaping CellConfigurator) {
        self.models = models
        self.cellIdentifier = cellIdentifier
        self.cellConfiguration = cellConfiguration
    }
    
    // MARK: - Implement UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        cellConfiguration(model, cell)
        return cell
    }

}
