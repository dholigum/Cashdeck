//
//  SampleView.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 29/07/21.
//

import SwiftUI

struct SampleView: View {
    
    var content: String
    
    var body: some View {
        let hello = Text("Hello, \(content)")
        
        return hello
    }
}
