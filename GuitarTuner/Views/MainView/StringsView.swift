//
//  StringsView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 20.07.2026.
//

import SwiftUI

struct StringsView: View {
    
    let instrument: Instrument
    
    var body: some View {
        GeometryReader { geometry in
            
            let width = geometry.size.width
            
            ZStack {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color("TunerScaleViewBackground").opacity(0.76))
                        .frame(width: width * 0.90)
                        .shadow(
                            color: .black.opacity(0.05),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                        .modifier(GlassModifier(cornerRadius: 14))
                    VStack(spacing: 0) {
                        Spacer()
                            ForEach(instrument.strings, id: \.self) { string in
                                StringRowView(note: string,
                                              width: width * 0.9
                                )
                                if string != instrument.strings.last {
                                    Spacer()
                                }
                            }
                        Spacer()
                        }
                        .padding(.vertical)
            }
            .frame(
            width: geometry.size.width,
            height: geometry.size.height
            )
        }
    }
    
    
}
