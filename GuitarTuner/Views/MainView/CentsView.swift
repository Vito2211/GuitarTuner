//
//  CentsView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

struct CentsView: View {
    
    var cents: Double
    
    var body: some View {
        Text(String(format: "%.0f", cents))
            .font(.system(size: 18, weight: .bold))
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .foregroundStyle(Color("Scale"))

            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.black.opacity(0.15))
                    .modifier(GlassModifier(cornerRadius: 20))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.white.opacity(0.15), lineWidth: 1)
            )
    }
}
