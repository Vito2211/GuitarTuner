//
//  ReferencePitchRow.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

struct ReferencePitchRow: View {
    
    @Binding var referencePitch: Double
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            HStack {
                
                Image(systemName: "tuningfork")
                    .frame(width: 25)
                    .foregroundStyle(Color("Scale"))
                
                Text("Reference Pitch")
                    .foregroundStyle(Color("Scale"))
                
                Spacer()
                
                Text("\(Int(referencePitch)) Hz")
                    .foregroundStyle(.secondary)
            }
            
            
            Slider(
                value: $referencePitch,
                in: 430...450,
                step: 1
            )
            .tint(Color("Scale"))
        }
        .padding()
    }
}
