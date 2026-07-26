//
//  CentsView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

struct CentsView: View {

    var cents: Double
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    private var isPad: Bool {
        horizontalSizeClass == .regular
    }
    private var fontSize: CGFloat {
        isPad ? 26 : 18
    }
    private var horizontalPadding: CGFloat {
        isPad ? 28 : 20
    }
    private var verticalPadding: CGFloat {
        isPad ? 12 : 8
    }
    private var cornerRadius: CGFloat {
        isPad ? 26 : 20
    }
    var body: some View {
        Text(String(format: "%.0f", cents))
            .font(.system(size: fontSize, weight: .bold))
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .foregroundStyle(Color("Scale"))
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(.black.opacity(0.15))
                    .modifier(GlassModifier(cornerRadius: cornerRadius))
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(.white.opacity(0.15), lineWidth: 1)
            )
    }
}
