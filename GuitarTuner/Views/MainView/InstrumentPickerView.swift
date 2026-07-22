//
//  InstrumentPickerView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 20.07.2026.
//

import SwiftUI

struct InstrumentPickerView: View {

    @Binding var selectedInstrument: Instrument
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack(spacing: 24) {

            Text("Instruments")
                .font(.largeTitle.bold())

            ScrollView {
                VStack(spacing: 16) {

                    ForEach(instruments) { instrument in

                        Button {
                            selectedInstrument = instrument
                            dismiss()
                        } label: {

                            HStack {

                                VStack(alignment: .leading, spacing: 6) {

                                    HStack(spacing: 2) {
                                        Text(instrument.name)
                                            .font(.title3.bold())

                                        Text(instrument.tuning)
                                            .font(.caption)
                                            .foregroundStyle(.secondary)
                                            .offset(x: 20)
                                    }
                                    HStack(spacing: 6) {
                                        ForEach(instrument.strings, id: \.self) { string in

                                            Text("\(string.name)\(string.octave)")
                                                .font(.caption.bold())
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 3)
                                                .background(Color.gray.opacity(0.2))
                                                .clipShape(Capsule())
                                        }
                                    }
                                }

                                Spacer()

                                if instrument.id == selectedInstrument.id {
                                    Image(systemName: "checkmark.circle.fill")
                                        .foregroundStyle(.green)
                                        .font(.title2)
                                }
                            }
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.ultraThinMaterial)
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
    }
}
