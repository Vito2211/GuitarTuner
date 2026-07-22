//
//  Instrument.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 21.07.2026.
//

import Foundation

struct Note: Hashable {
    let name: String
    let octave: Int
}

struct Instrument: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    let strings: [Note]
}


let guitar = Instrument(
    name: "Guitar",
    icon: "guitars",
    strings: [
        Note(name: "E", octave: 4),
        Note(name: "B", octave: 3),
        Note(name: "G", octave: 3),
        Note(name: "D", octave: 3),
        Note(name: "A", octave: 2),
        Note(name: "E", octave: 2)
    ]
)

let ukulele = Instrument(
    name: "Ukulele",
    icon: "guitars",
    strings: [
        Note(name: "A", octave: 4),
        Note(name: "E", octave: 4),
        Note(name: "C", octave: 4),
        Note(name: "G", octave: 4)
    ]
)

