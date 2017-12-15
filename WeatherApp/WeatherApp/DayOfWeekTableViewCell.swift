//
//  DayOfWeekTableViewCell.swift
//  WeatherApp
//
//  Created by Thuy Truong Quang on 12/15/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class DayOfWeekTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDay: UILabel!
    @IBOutlet weak var lblMin: UILabel!
    @IBOutlet weak var lblMax: UILabel!
    @IBOutlet weak var imgStatus: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
