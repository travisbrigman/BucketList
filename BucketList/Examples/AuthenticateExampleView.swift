//
//  AuthenticateExampleView.swift
//  BucketList
//
//  Created by Travis Brigman on 3/1/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct AuthenticateExampleView: View {
    @State private var isUnlocked = false
    var body: some View {
        VStack {
            if self.isUnlocked {
                Text("unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {     success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        //problem
                    }
                }
            }
        } else {
            //no biometrics
        }
    }
}

struct AuthenticateExampleView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticateExampleView()
    }
}
