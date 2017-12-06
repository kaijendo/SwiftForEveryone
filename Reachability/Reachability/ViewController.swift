//
//  ViewController.swift
//  Reachability
//
//  Created by Thuy Truong Quang on 12/4/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties

    @IBOutlet weak var notificationView: Reachable!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Da vao man hinh 1")

    }
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


