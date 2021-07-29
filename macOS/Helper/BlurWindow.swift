//
//  BlurWindow.swift
//  Cashdeck (iOS)
//
//  Created by Syahrul Apple Developer BINUS on 22/07/21.
//

import SwiftUI

struct BlurWindow: NSViewRepresentable {
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        
        let view = NSVisualEffectView()
        view.blendingMode = .behindWindow
        
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        
    }
}
