//
//  SetttingView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var showSettings: Bool
    @Binding var theme: String
    @Binding var referencePitch: Double
    @State private var showCredits = false
    @Environment(\.openURL) private var openURL
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
            VStack(spacing: 25) {
                HStack {
                    Text("Settings")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundStyle(Color("Scale"))
                    Spacer()
                    Button {
                        showSettings = false
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundStyle(Color("Scale"))
                    }
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack(spacing: 25) {
                        SettingsSection(title: "Appearance") {
                            ThemeRow(theme: $theme)
                                .modifier(GlassModifier(cornerRadius: 14))

                        }
                        SettingsSection(title: "Tuner Settings") {
                            ReferencePitchRow(referencePitch: $referencePitch)
                                .modifier(GlassModifier(cornerRadius: 14))

                        }
                        SettingsSection(title: "About") {
                            VStack {
                                SettingsRow(
                                    title: "Version",
                                    icon: nil,
                                    value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
                                )
                                SettingsRow(
                                    title: "GitHub",
                                    icon: "chevron.left.forwardslash.chevron.right"
                                ) {
                                    openURL(URL(string: "https://github.com/Vito2211/GuitarTuner")!)
                                }
                                SettingsRow(title: "Donate", icon: "heart") {}
                                SettingsRow(title: "Privacy Policy", icon: "hand.raised") {
                                    openURL(URL(string: "https://Vito2211.github.io/GuitarTuner/")!)
                                }
                                SettingsRow(title: "Credits", icon: "person.2") {
                                    showCredits = true                              }
                            }.modifier(GlassModifier(cornerRadius: 14))

                        }
                    }
                    .padding(.horizontal)
                }
                Spacer()
            }
            .padding(.top, 20)
        }
        .sheet(isPresented: $showCredits) {
            CreditsView()
        }
    }
}
