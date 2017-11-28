//
//  DetailsStudentViewController.swift
//  ShowNotification
//
//  Created by Thuy Truong Quang on 11/28/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class DetailsStudentViewController: UIViewController {
    // MARK: - Propertes
    /// Variable
    var index: Int?
    var student: Student?
    /// Outlets
    @IBOutlet weak var txtStudentName: UITextField!
    @IBOutlet weak var txtStudentAge: UITextField!
    @IBOutlet weak var doneButotn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func setupView() {

        if let student = self.student {
            navigationItem.title = student.name
            txtStudentName.text = student.name
            txtStudentAge.text = String(student.age ?? 0)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === doneButotn else {
            return
        }
        let name = txtStudentName.text ?? ""
        let age = Int(txtStudentAge.text ?? "0")
        student = Student(name: name, age: age)
    }
    
    
}
