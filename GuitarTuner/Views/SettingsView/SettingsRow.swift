//
//  SettingsRow.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 22.07.2026.
//

import SwiftUI

struct SettingsRow: View {

    let title: String
    let icon: String?
    let value: String?
    let action: () -> Void

    init(
        title: String,
        icon: String? = nil,
        value: String? = nil,
        action: @escaping () -> Void = {}
    ) {
        self.title = title
        self.icon = icon
        self.value = value
        self.action = action
    }


    var body: some View {
        Button(action: action) {

            HStack {

                if let icon {
                    Image(systemName: icon)
                        .frame(width: 25)
                        .foregroundStyle(Color("Scale"))
                }

                Text(title)
                    .foregroundStyle(Color("Scale"))

                Spacer()

                if let value {
                    Text(value)
                        .foregroundStyle(.secondary)
                } else {
                    Image(systemName: "chevron.right")
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
        .buttonStyle(.plain)
    }
}
