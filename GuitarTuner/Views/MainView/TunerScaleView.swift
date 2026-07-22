//
//  .swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 20.07.2026.
//

import SwiftUI

struct TunerScaleView: View {
    
    let cents: Double
    
    var body: some View {
        GeometryReader { geometry in
            
            let width = geometry.size.width
            let count = 21
            let spacing = width * 0.8 / CGFloat(count)
            let indicatorOffset = CGFloat(cents) / 50 * ((width * 0.75) / 2)
            
            ZStack {
                RoundedRectangle(cornerRadius: 14)
                    .fill(Color("TunerScaleViewBackground").opacity(0.76))
                    .modifier(GlassModifier(cornerRadius: 14))
                    .frame(width: width * 0.9,
                            height: width / 5
                    )
                    .shadow(
                            color: .black.opacity(0.05),
                            radius: 4,
                            x: 0,
                            y: 4
                        )
                    
                HStack(spacing: 0) {
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(
                            width: (width/55),
                            height: width / 15
                        )
                        .foregroundStyle(Color("Scale"))
                        .frame(width: spacing)
                    
                    
                    ForEach(0..<count, id: \.self) { index in
                        
                        RoundedRectangle(cornerRadius: 4)
                            .frame(
                                width: index == count / 2 ? (width/50) : (width/55),
                                height: index == count / 2 ? (width / 6 )
                                            : index % 5 == 0 ? (width / 8 ) : (width / 15)
                            )
                            .foregroundStyle(Color("Scale"))
                            .frame(width: spacing)
                    }
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(
                            width: (width/55),
                            height: width / 15
                        )
                        .foregroundStyle(Color("Scale"))
                        .frame(width: spacing)
                }
                .frame(width: width * 0.8)
                
                RoundedRectangle(cornerRadius: 14)
                    .frame(
                        width: 13,
                        height: width / 16
                    )
                    .foregroundStyle(.red)
                    .offset(x: indicatorOffset)
                    .animation(.spring(response: 0.6, dampingFraction: 0.7), value: cents)
            }
            .frame(width: width, height: 60)
            
        }
        .frame(height: 80)
        
    }
}
