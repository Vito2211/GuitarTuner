//
//  TopBarView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 20.07.2026.
//

import SwiftUI

struct TopBarView: View {
    
    @State private var showInstrumentPicker = false
    @Binding var selectedInstrument: Instrument
    @Binding var showSettings: Bool

    var body: some View {

        HStack {
            
                Button {
                    showInstrumentPicker.toggle()
                } label: {
                    Image(systemName: "guitars")
                        .foregroundStyle(Color("Scale"))
                        .font(.largeTitle)
                        .scaleEffect(1.2)
                }
                .frame(width: 65, height: 65)
                .modifier(GlassModifier(cornerRadius: 30))
                .offset(x: 15, y: 10)
                .buttonStyle(TunerButtonStyle())
                .sheet(isPresented: $showInstrumentPicker) {
                    InstrumentPickerView(
                        selectedInstrument: $selectedInstrument
                    )
                    .presentationDetents([.medium])
                }

                        Spacer()
            

            Button {
                showSettings.toggle()
            } label: {
                Image(systemName: "gearshape")
                    .foregroundStyle(Color("Scale"))
                    .font(.largeTitle)
                    .scaleEffect(1.2)
            }
            .frame(width: 65, height: 65)
            .modifier(GlassModifier(cornerRadius: 30))
            .offset(x: -15, y: 10)
            .buttonStyle(TunerButtonStyle())
        }
    }
}
