//
//  GlassModifier.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 21.07.2026.
//

import SwiftUI

struct GlassModifier: ViewModifier {

    var cornerRadius: CGFloat = 14

    func body(content: Content) -> some View {
        if #available(iOS 26.0, *) {
            content
                .glassEffect(
                    in: RoundedRectangle(cornerRadius: cornerRadius)
                )
        } else {
            content
                .background(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .fill(.ultraThinMaterial)
                )
        }
    }
}
