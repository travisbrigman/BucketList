//
//  Extension-GetDocuments.swift
//  BucketList
//
//  Created by Travis Brigman on 2/26/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import Foundation

extension FileManager {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
