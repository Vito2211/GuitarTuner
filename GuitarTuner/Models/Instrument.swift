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
    let id: String
    let name: String
    let tuning: String
    let icon: String
    let strings: [Note]
}


let guitarStandard = Instrument(
    id: "guitar_standard",
    name: "Guitar",
    tuning: "Standard",
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

let ukuleleStandard = Instrument(
    id: "ukulele_standard",
    name: "Ukulele",
    tuning: "Standard",
    icon: "guitars",
    strings: [
        Note(name: "A", octave: 4),
        Note(name: "E", octave: 4),
        Note(name: "C", octave: 4),
        Note(name: "G", octave: 4)
    ]
)

let bassStandard = Instrument(
    id: "bass_standard",
    name: "Bass",
    tuning: "Standard",
    icon: "guitars",
    strings: [
        Note(name: "E", octave: 2),
        Note(name: "A", octave: 2),
        Note(name: "D", octave: 1),
        Note(name: "G", octave: 1)
    ]
)

let guitarDropD = Instrument(
    id: "guitar_drop_d",
    name: "Guitar",
    tuning: "Drop D",
    icon: "guitars",
    strings: [
        Note(name: "E", octave: 4),
        Note(name: "B", octave: 3),
        Note(name: "G", octave: 3),
        Note(name: "D", octave: 3),
        Note(name: "A", octave: 2),
        Note(name: "D", octave: 2)
    ]
)

let guitarOpenG = Instrument(
    id: "guitar_open_g",
    name: "Guitar",
    tuning: "Open G",
    icon: "guitars",
    strings: [
        Note(name: "D", octave: 4),
        Note(name: "B", octave: 3),
        Note(name: "G", octave: 3),
        Note(name: "D", octave: 3),
        Note(name: "A", octave: 2),
        Note(name: "D", octave: 2)
    ]
)
