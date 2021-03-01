//
//  EnumExampleView.swift
//  BucketList
//
//  Created by Travis Brigman on 2/26/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("Loading...")
    }
}

struct SuccessView: View {
    var body: some View {
        Text("Error...")
    }
}

struct FailedView: View {
    var body: some View {
        Text("Failed...")
    }
}


struct EnumExampleView: View {
    enum LoadingState {
        case loading, success, failed
    }
    var loadingState = LoadingState.loading
    
    var body: some View {
        Group {
            if loadingState == .loading {
                LoadingView()
            } else if loadingState == .success {
                SuccessView()
            } else if loadingState == .failed {
                FailedView()
            }
        }
    }
}

struct BucketList_Previews: PreviewProvider {
    static var previews: some View {
        EnumExampleView()
    }
}
