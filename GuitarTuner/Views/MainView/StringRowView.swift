//
//  StringRowView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 20.07.2026.
//



import SwiftUI

//
//  StringRowView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 20.07.2026.
//

import SwiftUI

struct StringRowView: View {

    let note: Note
    let width: CGFloat

    private var isPad: Bool {
        width > 500
    }
    
    private var isLargePad: Bool {
        width > 900
    }
    
    private var circleSize: CGFloat {
        let cap: CGFloat = isLargePad ? 85 : 70
        return min(width / 8, cap)
    }

    private var lineWidth: CGFloat {
        let divisor: CGFloat = isPad ? 4.2 : 3.6
        return width - (width / divisor)
    }

    var body: some View {

        HStack {
            ZStack {
                Circle()
                    .fill(
                        RadialGradient(
                            colors: [
                                Color(red: 35/255, green: 35/255, blue: 35/255),
                                Color(red: 67/255, green: 67/255, blue: 67/255)
                            ],
                            center: .center,
                            startRadius: 10,
                            endRadius: width / 15
                        )
                    )

                HStack(alignment: .bottom, spacing: 1) {
                    Text(note.name)
                        .font(.system(size: width * 0.045, weight: .bold))

                    Text("\(note.octave)")
                        .font(.system(size: width * 0.045, weight: .bold))
                        .offset(y: 5)
                }
                .foregroundStyle(Color("SecondBackground"))
            }
            .frame(width: circleSize, height: circleSize)
            .offset(x: (width / 25))

            Spacer()

            Rectangle()
                .frame(width: lineWidth, height: (width/40))
                .foregroundStyle(Color("Scale"))

            Circle()
                .fill(Color("Scale"))
                .frame(width: (width/15), height: (width/15))
                .offset(x: -(width/20))
        }
        .frame(width: width)
        .padding(.horizontal, 20)
        .frame(height: 45)
    }
}
