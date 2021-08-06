//
//  BarView.swift
//  Cashdeck (iOS)
//
//  Created by Shiddiq Syuhada on 04/08/21.
//

import SwiftUI

struct BarView: View {
    
    var value: CGFloat
    var week: String
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom){
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.orange)
                
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
                Capsule().frame(width: 30, height: value)
                    .foregroundColor(.white)
            }
            Text(week)
        }
    }
}


