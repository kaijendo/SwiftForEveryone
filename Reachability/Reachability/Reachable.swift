//
//  Reachable.swift
//  Reachability
//
//  Created by Thuy Truong Quang on 12/5/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class Reachable: UIView {
    @IBOutlet var reachableView: Reachable!
    @IBOutlet weak var lblNotification: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView() {
        if AppDelegate.shared.reachability?.isReachable == true {
            self.backgroundColor = UIColor.green
            print("Mau xanh")
        } else {
            self.backgroundColor = UIColor.red
            print("Mau do")
        }
    }
}
