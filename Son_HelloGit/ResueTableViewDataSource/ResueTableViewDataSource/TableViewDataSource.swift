//
//  TableViewDataSource.swift
//  ResueTableViewDataSource
//
//  Created by Thuy Truong Quang on 10/3/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation
import UIKit
class TableViewDataSource<Model>: NSObject, UITableViewDataSource {
    typealias CellConfiguration = (Model, UITableViewCell) -> Void
    var data: [Model]
    let identifierCell: String
    let cellConfiguration: CellConfiguration
    
    init(data: [Model],identifierCell: String, cellConfiguaration: @escaping CellConfiguration) {
        self.identifierCell = identifierCell
        self.cellConfiguration = cellConfiguaration
        self.data = data
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: identifierCell, for: indexPath)
        cellConfiguration(item, cell)
        return cell
    }
}
