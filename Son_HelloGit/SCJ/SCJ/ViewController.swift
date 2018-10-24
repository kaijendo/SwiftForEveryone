//
//  ViewController.swift
//  SCJ
//
//  Created by Trinh Bao Son on 10/23/18.
//  Copyright © 2018 Trinh Bao Son. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    
    // MARK: - Outlets
    @IBOutlet weak var dataLabel: UILabel!
    @IBOutlet weak var dataTextField: UITextField!
    @IBOutlet weak var updateTextField: UITextField!
    @IBOutlet weak var MyUpdateButton: UIButton!
    @IBOutlet weak var MyDeleteButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButton(_ sender: Any) {
       createData()
    }
    
    @IBAction func upDateButton(_ sender: Any) {
        updateData()
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        deleteData()
    }
    
    @IBAction func inputButton(_ sender: Any) {
         retrieveData()
        
    }
}


