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
    enum LoadingState {
        case loading, loaded, failed
    }
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var placemark: MKPointAnnotation
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("place name", text: $placemark.wrappedTitle)
                    TextField("Description", text: $placemark.wrappedSubTitle)
                }
                
                Section(header: Text("Nearby")){
                    if loadingState == .loaded {
                        List(pages, id: \.pageid) { page in
                            Text(page.title)
                                .font(.headline)
                            + Text(": ") +
                            Text("Page Description Here")
                            .italic()
                        }
                    } else if loadingState == .loading {
                        Text("loading...")
                    } else {
                        Text("please try again later")
                    }
                }
            }
            .navigationBarTitle("Edit Place")
                .navigationBarItems(trailing: Button("Done"){
                    self.presentationMode.wrappedValue.dismiss()
                })
                .onAppear(perform: fetchNearbyPlaces)
        }
    }
    
    func fetchNearbyPlaces() {
        let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(placemark.coordinate.latitude)%7C\(placemark.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        guard let url = URL(string: urlString) else { print("bad url: \(urlString)")
            return }
        URLSession.shared.dataTask(with: url) { data, resposne, error  in
            if let data = data {
                let decoder = JSONDecoder()
                
                if let items = try? decoder.decode(Result.self, from: data) {
                    self.pages = Array(items.query.pages.values)
                    self.loadingState = .loaded
                    return
                }
            }
            self.loadingState = .failed
        }.resume()
        
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(placemark: MKPointAnnotation.example)
    }
}
