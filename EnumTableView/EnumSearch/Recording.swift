//
//  Recording.swift
//  EnumSearch
//
//  Created by Thuy Truong Quang on 6/19/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation

struct Recording: Codable {
    let genus: String
    let species: String
    let friendlyName: String
    let country: String
    let fileURL: URL
    let date: String
}
