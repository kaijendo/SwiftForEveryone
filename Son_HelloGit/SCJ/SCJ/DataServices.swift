//
//  DataServices.swift
//  SCJ
//
//  Created by Thuy Truong Quang on 10/24/18.
//  Copyright © 2018 Trinh Bao Son. All rights reserved.
//

import Foundation
import CoreData

class DataServices {
    static let shared = DataServices()
    
    let context = AppDelegate.shared.persistentContainer.viewContext
    func createData() {
        l
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
        let context = appDelegate.persistentContainer.viewContext
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
        let context = appDelegate.persistentContainer.viewContext
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
        let context = appDelegate.persistentContainer.viewContext
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
