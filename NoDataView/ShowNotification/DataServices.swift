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
    /// Variable for Studnent
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
    
    /// Variable for Number
    private var _number: [Int]!
    var number: [Int] {
        get {
            if _number == nil {
                updateNumber()
            }
            return _number ?? []
        }
        set {
            _number = newValue
        }
    }
    
    // MARK: - Private Function
    fileprivate func updateNumber() {
        _number = []
        
    }
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
    
    /// Function for Number
    func addNewNumber(newNumber: Int) {
        _number.append(newNumber)
    }
    func updateNumber(newNumber: Int, at index: Int) {
        _number[index] = newNumber
    }
    func removeNumber(at index: Int) {
        _number.remove(at: index)
    }
}

