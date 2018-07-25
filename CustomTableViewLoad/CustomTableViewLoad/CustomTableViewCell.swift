//
//  CustomTableViewCell.swift
//  CustomTableViewLoad
//
//  Created by Thuy Truong Quang on 7/25/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var UserImageView: UIImageView!
    @IBOutlet weak var labelFirst: UILabel!
    @IBOutlet weak var labelLast: UILabel!
    
    @IBOutlet weak var containerView: UIVisualEffectView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configuaration() {
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
