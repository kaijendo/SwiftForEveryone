//
//  StudentTableViewController.swift
//  ShowNotification
//
//  Created by Thuy Truong Quang on 11/28/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController {
    @IBOutlet var nodataView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
      //  setupData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        if DataServices.shared.students.count > 0 {
            return 1
        } else {
            setupView()
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataServices.shared.students.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = DataServices.shared.students[indexPath.row].name
        cell.detailTextLabel?.text = "\(DataServices.shared.students[indexPath.row].age ?? 0)"

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            DataServices.shared.removeStudent(at: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier ?? "" {
        case "AddStudent":
            break
        case "EditStudent":
            guard let detailsVC = segue.destination as? DetailsStudentViewController else {
                return
            }
            guard let indexPath = tableView.indexPathForSelectedRow else {
                return
            }
            let selectStudent = DataServices.shared.students[indexPath.row]
            detailsVC.student = selectStudent
        default:
            break
        }
    }
    @IBAction func unwindToMain(sender: UIStoryboardSegue) {
        if let sourceVC = sender.source as? DetailsStudentViewController, let student = sourceVC.student {
            if let indexPath = tableView.indexPathForSelectedRow {
                DataServices.shared.updateStudent(newStudent: student, at: indexPath.row)
            } else {
                DataServices.shared.addNewStudent(newStudent: student)
            }
        }
        setupView()
    }
    
    fileprivate func setupView() {
        print("Studnet \(DataServices.shared.students.count)")
        if DataServices.shared.students.count == 0 {
            self.tableView.backgroundView = nodataView
            self.tableView.isScrollEnabled = false
        }
        else {
            self.tableView.isScrollEnabled = true
            self.tableView.backgroundView = nil
        }
    }
}
