//
//  MKPointAnnotation-ObservableObject.swift
//  BucketList
//
//  Created by Travis Brigman on 3/1/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unkown Value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubTitle: String {
        get {
            self.subtitle ?? "Unkown Value"
        }
        set {
            subtitle = newValue
        }
    }
}
