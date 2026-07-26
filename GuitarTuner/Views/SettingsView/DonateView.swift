//
//  DonateView.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 26.07.2026.
//

import SwiftUI

struct DonateView: View {

    var body: some View {

        VStack(spacing: 25) {

            Image(systemName: "heart.fill")
                .font(.system(size: 60))
                .foregroundStyle(.red)

            Text("Support GuitarTuner")
                .font(.largeTitle.bold())

            Text("""
            GuitarTuner is completely free.

            There are no ads, subscriptions or locked features.

            If you enjoy using the app and would like to support its development, you can make a voluntary donation.

            Every contribution helps improve the app and add new instruments and features.

            ^^Thank you for your support!!!
            """)
            .multilineTextAlignment(.center)
            .foregroundStyle(.secondary)
            .fixedSize(horizontal: false, vertical: true)

            Spacer()

            VStack(spacing: 14) {

                Button {

                } label: {
                    HStack {
                        Image(systemName: "cup.and.saucer.fill")

                        Text("Buy me a coffee")
                            .fontWeight(.semibold)

                        Spacer()

                        Text("€2.99")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(TunerButtonStyle())
                .modifier(GlassModifier(cornerRadius: 14))


                Button {

                } label: {
                    HStack {
                        Image(systemName: "guitars")

                        Text("Buy me guitar strings")
                            .fontWeight(.semibold)

                        Spacer()

                        Text("€4.99")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(TunerButtonStyle())
                .modifier(GlassModifier(cornerRadius: 14))


                Button {

                } label: {
                    HStack {
                        Image(systemName: "heart.fill")

                        Text("Support development")
                            .fontWeight(.semibold)

                        Spacer()

                        Text("€9.99")
                            .foregroundStyle(.secondary)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(TunerButtonStyle())
                .modifier(GlassModifier(cornerRadius: 14))
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Donate")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DonateView()
    }
}
