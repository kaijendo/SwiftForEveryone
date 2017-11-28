//
//  DataServices.swift
//  ShowNotification
//
//  Created by Thuy Truong Quang on 11/28/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import Foundation

class DataServices {
    static let shared = DataServices()
    
    private var _students: [Student]!
    var students: [Student] {
        get {
            if _students == nil {
                updateStudent()
            }
            return _students ?? []
        }
        set {
            _students = newValue
        }
    }
    // MARK: - Private Function
    fileprivate func updateStudent() {
        _students = []
        
    }
    /// Function for Student
    func addNewStudent(newStudent: Student) {
        _students.append(newStudent)
    }
    func updateStudent(newStudent: Student, at index: Int) {
        _students[index] = newStudent
    }
    func removeStudent(at index: Int) {
        _students.remove(at: index)
    }
}

