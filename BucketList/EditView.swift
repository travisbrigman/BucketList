//
//  EditView.swift
//  BucketList
//
//  Created by Travis Brigman on 3/1/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI
import MapKit

struct EditView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("place name", text: $placemark.wrappedTitle)
                    TextField("Description", text: $placemark.wrappedSubTitle)
                }
            }
        }
    .navigationBarTitle("Edit Place")
        .navigationBarItems(trailing: Button("Done"){
            self.presentationMode.wrappedValue.dismiss()
        })
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(placemark: MKPointAnnotation.example)
    }
}
