//
//  SettingsSection.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

struct SettingsSection<Content: View>: View {
    
    let title: String
    let content: Content
    
    init(
        title: String,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.content = content()
    }
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text(title)
                .font(.headline)
                .foregroundStyle(Color("Scale"))
            
            VStack(spacing: 0) {
                content
            }
            .modifier(GlassModifier(cornerRadius: 20))
        }
    }
}
