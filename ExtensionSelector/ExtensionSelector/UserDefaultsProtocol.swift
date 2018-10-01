//
//  UserDefaultsProtocol.swift
//  ExtensionSelector
//
//  Created by Thuy Truong Quang on 10/1/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation

protocol KeyNamespaceable { }

extension KeyNamespaceable {
    private static func namespace(_ key: String) -> String {
        return "\(Self.self).\(key)"
    }
    
    static func namespace<T: RawRepresentable>(_ key: T) -> String where T.RawValue == String {
        return namespace(key.rawValue)
    }
}

protocol BoolUserDefaultable: KeyNamespaceable {
    associatedtype BoolDefaultKey: RawRepresentable
}

extension BoolUserDefaultable where BoolDefaultKey.RawValue == String {
    static func set(_ bool: Bool, forKey key: BoolDefaultKey) {
        let key = namespace(key)
        UserDefaults.standard.set(bool, forKey: key)
    }
    
    static func bool(forKey key: BoolDefaultKey) -> Bool {
        let key = namespace(key)
        return UserDefaults.standard.bool(forKey: key)
        
    }
}

protocol FloatUserDefaultable: KeyNamespaceable {
    associatedtype FloatDefaultKey: RawRepresentable
}

extension FloatUserDefaultable where FloatDefaultKey.RawValue == String {
    static func set(_ float: Float, forKey key: FloatDefaultKey) {
        let key = namespace(key)
        UserDefaults.standard.set(float, forKey: key)
    }
    
    static func float(forKey key: FloatDefaultKey) -> Float {
        let key = namespace(key)
        return UserDefaults.standard.float(forKey: key)
    }
}


protocol IntegerUserDefaultable: KeyNamespaceable {
    associatedtype IntegerDefaultKey: RawRepresentable
}

extension IntegerUserDefaultable where IntegerDefaultKey.RawValue == String {
    static func set(_ integer: Int, forKey key: IntegerDefaultKey) {
        let key = namespace(key)
        UserDefaults.standard.set(integer, forKey: key)
    }
    
    static func integer(forKey key: IntegerDefaultKey) -> Int {
        let key = namespace(key)
        return UserDefaults.standard.integer(forKey: key)
    }
}


protocol ObjectUserDefaultable: KeyNamespaceable {
    associatedtype ObjectDefaultKey: RawRepresentable
}

extension ObjectUserDefaultable where ObjectDefaultKey.RawValue == String {
    static func set(_ object: AnyObject, forKey key: ObjectDefaultKey) {
        let key = namespace(key)
        UserDefaults.standard.set(object, forKey: key)
    }
    
    static func object(forKey key: ObjectDefaultKey) -> Any? {
        let key = namespace(key)
        return UserDefaults.standard.object(forKey: key)
    }
}

protocol DoubleUserDefaultable : KeyNamespaceable {
    associatedtype DoubleDefaultKey : RawRepresentable
}

extension DoubleUserDefaultable where DoubleDefaultKey.RawValue == String {

    static func set(_ double: Double, forKey key: DoubleDefaultKey) {
        let key = namespace(key)
        UserDefaults.standard.set(double, forKey: key)
    }

    static func double(forKey key: DoubleDefaultKey) -> Double {
        let key = namespace(key)
        return UserDefaults.standard.double(forKey: key)
    }
}


protocol URLUserDefaultable : KeyNamespaceable {
    associatedtype URLDefaultKey : RawRepresentable
}

extension URLUserDefaultable where URLDefaultKey.RawValue == String {

    static func set(_ url: URL, forKey key: URLDefaultKey) {
        let key = namespace(key)
        UserDefaults.standard.set(url, forKey: key)
    }

    static func url(forKey key: URLDefaultKey) -> URL? {
        let key = namespace(key)
        return UserDefaults.standard.url(forKey: key)
    }
}
