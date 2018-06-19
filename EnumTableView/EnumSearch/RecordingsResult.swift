//
//  RecordingsResult.swift
//  EnumSearch
//
//  Created by Thuy Truong Quang on 6/19/18.
//  Copyright © 2018 Thuy Truong Quang. All rights reserved.
//

import Foundation

struct RecordingsResult {
    let recordings: [Recording]?
    let error: Error?
    let currentPage: Int
    let pageCount: Int
    
    var hasMorePages: Bool {
        return currentPage < pageCount
    }
    
    var nextPage: Int {
        return hasMorePages ? currentPage + 1 : currentPage
    }
    
}
