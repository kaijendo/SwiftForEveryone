//
//  Constants.swift
//  ExtensionSelector
//
//  Created by Thuy Truong Quang on 10/1/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation

// MARK: - UserDefault

/// Define all properties of user defaults
extension UserDefaults {
    struct Account: BoolUserDefaultable {
        private init() {}
        
        enum BoolDefaultKey: String {
            case isUserLogged
        }
    }
}



