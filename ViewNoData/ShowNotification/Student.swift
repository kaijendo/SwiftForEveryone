//
//  Student.swift
//  ShowNotification
//
//  Created by Thuy Truong Quang on 11/28/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import Foundation

struct Student {
    var name: String?
    var age: Int?
    
    init?(name: String?, age: Int?) {
        guard name != "", age != 0 else {
            return nil
        }
        self.name = name
        self.age = age
    }
}
