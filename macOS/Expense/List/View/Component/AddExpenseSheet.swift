//
//  AddExpenseSheet.swift
//  Cashdeck
//
//  Created by Syahrul Apple Developer BINUS on 03/08/21.
//

import SwiftUI

struct AddExpenseSheet: View {
    
    @Binding var isVisible: Bool
    
    var body: some View {
        VStack {
            Text("This is a sheet.")
            Button("OK") {
                self.isVisible = false
            }
        }
        .frame(width: 392, height: 685)
        .background(Color("MainColor"))
    }
}
