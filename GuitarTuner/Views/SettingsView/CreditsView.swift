//
//  CreditsView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

struct CreditsView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            
            Text("GuitarTuner")
                .font(.largeTitle)
                .bold()
            
            Text("""
            Developed by Viktor Pavliuk^^
            
            Built with:
            • SwiftUI
            • AVFoundation
            
            
            
            """)
            .multilineTextAlignment(.center)
        }
        .padding()
    }
}
