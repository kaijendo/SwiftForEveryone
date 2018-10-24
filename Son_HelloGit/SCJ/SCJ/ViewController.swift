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
    
    let context = AppDelegate.shared.persistentContainer.viewContext
    
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
    
    
    func createData() {
        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)!
        let newData = NSManagedObject(entity: entity, insertInto: context)
        newData.setValue(dataTextField.text, forKey: "data")
        
        do {
            try context.save()
            self.dataTextField.text = ""
        }catch {
            fatalError()
        }
    }
    
    func retrieveData() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        do {
            let result = try context.fetch(request)
            for data in result as! [NSManagedObject] {
                dataLabel.text = data.value(forKey: "data") as? String
            }
        }catch{
            fatalError()
        }
    }
    
    func updateData() {

        let request:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Entity")
        request.predicate = NSPredicate(format: "data = %@", dataLabel.text ?? "")
        do {
            let text = try context.fetch(request)
            if !text.isEmpty {
                let objectUpdate = text[0] as? NSManagedObject
                self.dataLabel.text = updateTextField.text
            }
            do {
                try context.save()
            } catch  {
                fatalError()
            }
        }catch{
            fatalError()
        }
    }
    
    func deleteData() {
        //        let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context)!
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
        request.predicate = NSPredicate(format: "data = %@", dataLabel.text ?? "")
        
        do {
            let text = try context.fetch(request)
            if !text.isEmpty{
                let objectDelete = text[0] as? NSManagedObject
                context.delete(objectDelete!)
                self.dataLabel.text = ""
            }
            do {
                try context.save()
            }catch{
                fatalError()
            }
        }catch{
            fatalError()
        }
    }
}


