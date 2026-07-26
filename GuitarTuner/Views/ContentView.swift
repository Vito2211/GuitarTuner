//
//  ContentView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 12.07.2026.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var audioManager = AudioManager()
    
    
    
    @State private var currentOctave = "-"
    @State private var currentNote = "-"
    @State private var currentCents = 0.0
    
    @AppStorage("instrument") private var savedInstrument = "Guitar"
    @State private var selectedInstrument = guitarStandard
    
    @State private var showSettings = false
    
    @AppStorage("theme") private var theme = AppTheme.system.rawValue
    @AppStorage("referencePitch") private var referencePitch = 440.0
    
    
    
    var body: some View {
        GeometryReader { geo in
            
            let is13InchIPad: Bool = geo.size.width > 1000
            
            let stringsHeightRatio: CGFloat = is13InchIPad ? 0.43 : 0.30
            
            ZStack {
                Color("Background")
                    .ignoresSafeArea()

                VStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        NoteView(
                            note: currentNote,
                            octave: currentOctave,
                            cents: Int(currentCents)
                        )
                        TopBarView(
                            selectedInstrument: $selectedInstrument,
                            showSettings: $showSettings
                        )
                        .padding(.top, 10)
                        .zIndex(1)
                        
                        CentsView(cents: currentCents)
                            .offset(y: 0)
                    }
                    .frame(height: geo.size.height * 0.40)

                    TunerScaleView(cents: currentCents)
                        

                    Spacer(minLength: 15)

                    StringsView(instrument: selectedInstrument)
                        .frame(height: geo.size.height * stringsHeightRatio)

                    Spacer(minLength: 6)
                }
                .frame(width: geo.size.width, height: geo.size.height)

                if showSettings {
                    SettingsView(
                        showSettings: $showSettings,
                        theme: $theme,
                        referencePitch: $referencePitch
                    )
                    .transition(.move(edge: .trailing))
                    .zIndex(2)
                }
            }
        }
        .preferredColorScheme(
            theme == "Dark" ? .dark :
            theme == "Light" ? .light :
            nil
        )
        .animation(.spring(response: 0.4, dampingFraction: 0.8), value: showSettings)
        .onAppear {
            if let instrument = instruments.first(where: {
                $0.name == savedInstrument
            }) {
                selectedInstrument = instrument
            }

            audioManager.referencePitch = referencePitch

            audioManager.onNoteDetected = { result in
                currentOctave = String(result.octave)
                currentNote = result.note
                currentCents = result.cents
            }
            audioManager.requestPermission {
                audioManager.setupAudioSession()
                audioManager.testAudio()
            }
        }
        .onChange(of: selectedInstrument.name) { _, newValue in
            savedInstrument = newValue
        }
        .onChange(of: referencePitch) { _, newValue in
            audioManager.referencePitch = newValue
        }
    }}

#Preview {
    ContentView()
}
