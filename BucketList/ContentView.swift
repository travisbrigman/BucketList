//
//  ContentView.swift
//  BucketList
//
//  Created by Travis Brigman on 2/26/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    
    var body: some View {
        MapView()
            .edgesIgnoringSafeArea(.all)
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
