//
//  ComparableExampleView.swift
//  BucketList
//
//  Created by Travis Brigman on 2/26/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI
struct User: Identifiable, Comparable {
    let id = UUID()
    let firstName: String
    let lastName: String
    
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ComparableExampleView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister"),
    ].sorted()
    var body: some View {
        List(users) { user in
                Text("\(user.lastName), \(user.firstName)")
            }
        }
    }


struct ComparableExampleView_Previews: PreviewProvider {
    static var previews: some View {
        ComparableExampleView()
    }
}
