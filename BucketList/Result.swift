//
//  Result.swift
//  BucketList
//
//  Created by Travis Brigman on 3/1/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import Foundation


struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
    
    var description: String {
        terms?["description"]?.first ?? "No Description"
    }
    
    static func < (lhs: Page, rhs: Page) -> Bool {
        return lhs.title < rhs.title
    }
}
