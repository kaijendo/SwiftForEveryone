//
//  Constants.swift
//  EnumSearch
//
//  Created by Thuy Truong Quang on 6/19/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation
import UIKit

class Constants {
    static let darkColor = UIColor(red: 11/255, green: 86/255, blue: 14/255, alpha: 1)
    
}

enum SearchState {
    case loading
    case populated([Recording])
    case paging([Recording], next: Int)
    case empty
    case error(Error)
    
    var currentRecordings: [Recording] {
        switch self {
        case .paging(let recordings, _):
            return recordings
        case .populated(let recordings):
            return recordings
        default:
            return []
        }
    }
}

