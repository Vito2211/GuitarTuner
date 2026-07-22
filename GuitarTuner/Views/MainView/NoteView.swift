//
//  NoteView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 20.07.2026.
//

import SwiftUI


struct NoteView: View {

    let note: String
    let octave: String
    let cents: Int
    
    
    
    
    
    var body: some View {
        
        GeometryReader { geometry in
            
            let size = min(geometry.size.width * 0.5, 220)
            
            ZStack {
                Rectangle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color("RectangleGradientIN").opacity(0.9),
                                Color("RectangleGradientOUT").opacity(0.5)
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: size)
                        )
                        .frame(
                            width: geometry.size.width,
                            height: size * 2
                        )
                Rectangle()
                    .foregroundStyle(Color("Scale"))
                    .frame(
                        width: geometry.size.width - 30,
                        height: size / 15
                    )
                if cents >= -5 && cents <= 5 {
                    Circle()
                        .fill(
                            RadialGradient(
                                colors: [
                                    Color("CentsBubbleIN"),
                                    Color("CentsBubbleOUT")
                                ],
                                center: .center,
                                startRadius: 10,
                                endRadius: size / 2
                            )
                        )
                        .frame(width: size+25, height: size+25)
                        
                }
                Circle()
                    .foregroundStyle(Color("Scale"))
                    .frame(width: size/5, height: size/5)
                    .offset(x: (geometry.size.width / 2) - 30)
                Circle()
                    .foregroundStyle(Color("Scale"))
                    .frame(width: size/5, height: size/5)
                    .offset(x: -((geometry.size.width / 2) - 30))
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color("BubbleIN"),
                                Color("BubbleOUT")
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: size / 2
                        )
                    )
                    .frame(width: size, height: size)
                    

                    //.shadow(color: .black.opacity(0.2), radius: 10, y: 5)
                HStack(alignment: .bottom) {
                    
                    Text(note)
                        .font(.system(size: size * 0.42, weight: .bold))
                        .bold()
                        .foregroundStyle(Color("Scale"))
                    Text(octave)
                        .font(.system(size: size * 0.17, weight: .bold))
                        .bold()
                        .foregroundStyle(Color("Scale"))
                    
                }
            }
            .frame(width: geometry.size.width,
                   height: geometry.size.height)
        }.allowsHitTesting(false)
        
    }
}


