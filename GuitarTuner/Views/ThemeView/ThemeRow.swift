//
//  ThemeRow.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

struct ThemeRow: View {
    
    @Binding var theme: String
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "paintpalette")
                .frame(width: 25)
                .foregroundStyle(Color("Scale"))
            
            Text("Theme")
                .foregroundStyle(Color("Scale"))
            
            Spacer()
            
            Picker("", selection: $theme) {
                ForEach(AppTheme.allCases) { theme in
                    Text(theme.rawValue)
                        .tag(theme.rawValue)
                }
            }
            .pickerStyle(.menu)
        }
        .padding()
    }
}
