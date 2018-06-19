//
//  ServiceResponse.swift
//  EnumSearch
//
//  Created by Thuy Truong Quang on 6/19/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation

struct ServiceResponse: Codable {
    let recordings: [Recording]
    let page: Int
    let numPages: Int
}
