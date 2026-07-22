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
                        .font(.title3.bold())

                    Text("\(note.octave)")
                        .font(.caption)
                        .offset(y: 5)
                }
                .foregroundStyle(Color("SecondBackground"))
            }
            .frame(
                width: width / 8,
                height: width / 8
            )
            .offset(x: (width / 25))

            Spacer()
            
            Rectangle()
                .frame(width: (width-(width/3.6)), height: (width/40))
                .foregroundStyle(Color("Scale"))
                

            Circle()
                .fill(Color("Scale"))
                .frame(width: (width/15), height: (width/15))
                .offset(x: -(width/20))
        }
        .padding(.horizontal, 20)
        .frame(height: 45)
    }
}
