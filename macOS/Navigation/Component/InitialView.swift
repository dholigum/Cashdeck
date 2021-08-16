//
//  InitialView.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 12/08/21.
//

import SwiftUI

struct InitialView: View {
    var body: some View {
        VStack(alignment: .center) {
            
            Image("noOptionSelectedIllustration")
                .resizable()
                .frame(width: 600, height: 294)
                .aspectRatio(contentMode: .fill)
            
            Text("Select option from the left.")
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .foregroundColor(Color("AccentColor2"))
        }
        .padding(.top, 36)
    }
}

struct InitialView_Previews: PreviewProvider {
    static var previews: some View {
        InitialView()
    }
}
