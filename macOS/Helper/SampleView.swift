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
        Text("Hello, \(content)")
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView(content: "Lorem")
    }
}
