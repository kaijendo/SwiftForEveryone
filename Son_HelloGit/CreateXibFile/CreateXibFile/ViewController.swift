//
//  ViewController.swift
//  CreateXibFile
//
//  Created by Thuy Truong Quang on 10/3/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func showAlertButtonTapped(_ sender: UIButton) {
        let alert = BaseAlertViewController(nibName: "BaseAlertViewController", bundle: nil)
        self.present(alert, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

