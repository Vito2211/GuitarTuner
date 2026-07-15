//
//  ContentView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 12.07.2026.
//

import SwiftUI

struct ContentView: View {
    let audioManager = AudioManager()
    
    var body: some View {
        Text("Hello, World!")
        .onAppear {
            audioManager.requestPermission {
                audioManager.setupAudioSession()
                audioManager.testAudio()
            }
        }
        
        
            }
}

#Preview {
    ContentView()
}
