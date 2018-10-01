//
//  Charactor.swift
//  ExtensionSelector
//
//  Created by Thuy Truong Quang on 10/1/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation
typealias JSON = Dictionary<String, Any>

struct Hero {
    let name: String
    let power: String
    
    init?(dict: JSON) {
        guard
            let name = dict["name"] as? String,
            let power = dict["power"] as? String
        else {
            return nil
        }
        self.name = name
        self.power = power
    }
}

struct Pricess {
    let name: String
    let kingdom: String
    
    init?(dict: JSON) {
        guard
            let name = dict["name"] as? String,
            let kingdom = dict["kingdom"] as? String
        else {
            return nil
        }
        self.name = name
        self.kingdom = kingdom
    }
}

struct Civilian {
    let name: String
    
    init?(dict: JSON) {
        guard let name = dict["name"] as? String else {
            return nil
        }
        self.name = name
    }
}


/// Define all model
enum Charactor {
    case hero(Hero)
    case pricess(Pricess)
    case civilian(Civilian)
    
    private enum `Type`: String {
        case hero, princess, civilian
        
        static let key = "type"
    }
    
    init?(dict: JSON) {
        guard
            let string = dict[Type.key] as? String,
            let type = Type(rawValue: string)
            else {
                return nil
        }
        
        switch type {
        case .hero:
            guard let hero = Hero(dict: dict) else {
                return nil
            }
            self = .hero(hero)
            
        case .princess:
            guard let pricess = Pricess(dict: dict) else {
                return nil
            }
            self = .pricess(pricess)
        case .civilian:
            guard let civilian = Civilian(dict: dict) else {
                return nil
            }
            self = .civilian(civilian)
        }
    }
}
