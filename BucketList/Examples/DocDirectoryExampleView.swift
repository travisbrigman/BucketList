//
//  DocDirectoryExampleView.swift
//  BucketList
//
//  Created by Travis Brigman on 2/26/21.
//  Copyright © 2021 Travis Brigman. All rights reserved.
//

import SwiftUI

struct DocDirectoryExampleView: View {
    let files = FileManager()
    
    var body: some View {
        Text("Hello")
            .onTapGesture {
                let str = "Test Message"
                let url = self.files.getDocumentsDirectory().appendingPathComponent("message.text")
                
                do {
                    try str.write(to: url, atomically: true, encoding: .utf8)
                    let input = try String(contentsOf: url)
                    print(input)
                } catch {
                    print(error.localizedDescription)
                }
        }
    }
}

struct DocDirectoryExampleView_Previews: PreviewProvider {
    static var previews: some View {
        DocDirectoryExampleView()
    }
}
