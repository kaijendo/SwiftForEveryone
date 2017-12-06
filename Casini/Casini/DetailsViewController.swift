//
//  DetailsViewController.swift
//  Casini
//
//  Created by Thuy Truong Quang on 12/6/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var txtName: UITextField!
    
    var text: String?
    override func viewDidLoad() {
        super.viewDidLoad()
         let rightItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveContext))
        navigationController?.topViewController!.navigationItem.rightBarButtonItem = rightItem
        txtName.text = text?.description

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func saveContext() {
            print("Da vao save")
    }
    

}
