//
//  ProductModel.swift
//  WeatherApp
//
//  Created by Thuy Truong Quang on 12/11/17.
//  Copyright © 2017 Thuy Truong Quang. All rights reserved.
//

import Foundation

protocol ProductModel {
    var documentID: String { get set }
    var providerID: String { get set }
}

protocol RawProductModel {
    var observationTime: Date? { get set }
    var lastViewTime: Date? { get set }
    var lastUpdatedTime: Date? { get set }
}
