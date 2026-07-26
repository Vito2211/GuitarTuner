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
            let height = geometry.size.height

            
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
                        if height >= 300 {Spacer()}
                            ForEach(instrument.strings, id: \.self) { string in
                                StringRowView(note: string,
                                              width: width * 0.9
                                )
                                if string != instrument.strings.last {
                                    Spacer()
                                    if height >= 300 {
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    } else if height >= 350 {
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                        Spacer()
                                    }
                                }
                            }
                        if height >= 300 {Spacer()}
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
