//
//  Theme.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

enum AppTheme: String, CaseIterable, Identifiable {
    
    case system = "System"
    case dark = "Dark"
    case light = "Light"
    
    var id: String {
        rawValue
    }
}
