//
//  MainView.swift
//  BucketList
//
//  Created by Travis Brigman on 3/2/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI
import MapKit

struct MainView: View {
    @Binding var selectedPlace: MKPointAnnotation?
    @Binding var locations: [CodableMKPointAnnotation]
    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var showingEditScreen: Bool
    @Binding var showingPlaceDetails: Bool
    
    
    var body: some View {
        
        Group {
        MapView(centerCoordinate: $centerCoordinate, selectedPlace: $selectedPlace, showingPlaceDetails: $showingPlaceDetails,  annotations: locations)
            .edgesIgnoringSafeArea(.all)
        Circle()
            .fill(Color.blue)
            .opacity(0.3)
            .frame(width: 32, height: 32)
        VStack {
            Spacer()
            HStack{
                Spacer()
                Button(action: {
                    let newLocation = CodableMKPointAnnotation()
                    newLocation.title = "Example Location"
                    newLocation.coordinate = self.centerCoordinate
                    self.locations.append(newLocation)
                    
                    self.selectedPlace = newLocation
                    self.showingEditScreen = true
                }) {
                    Image(systemName: "plus")
                        .padding()
                        .background(Color.black.opacity(0.75))
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                        .padding(.trailing)
                }
                
            }
        }
    }
}
}

//struct MainView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainView(selectedPlace: <#Binding<MKPointAnnotation?>#>, locations: <#Binding<[CodableMKPointAnnotation]>#>, centerCoordinate: <#Binding<CLLocationCoordinate2D>#>, showingEditScreen: <#Binding<Bool>#>, showingPlaceDetails: <#Binding<Bool>#>)
//    }
//}
