//
//  NoteConvetor.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 12.07.2026.
//

import Foundation

struct NoteResult {
    let octave: Int
    let note: String
    let cents: Double
}

final class NoteConverter {
    
    var referencePitch: Double = 440.0
    
    func convert(frequency: Double) -> NoteResult {
        let A4 = referencePitch
        
        let midi = Int(round(69 + 12 * log2(frequency / A4)))
        let notes = [
        "C",
        "C#",
        "D",
        "D#",
        "E",
        "F",
        "F#",
        "G",
        "G#",
        "A",
        "A#",
        "B"
        ]
        
        let noteIndex = (midi % 12 + 12) % 12

        let octave = midi / 12 - 1
        
        let noteName = notes[noteIndex]
        
        let perfectFrequency = A4 * pow(2.0, Double(midi - 69) / 12.0)
        
        let cents = 1200 * log2(frequency / perfectFrequency)
        print("Cents:", cents)
        
        return NoteResult(
            octave: octave,
            note: noteName,
            cents: cents
        )
        
    }
    

    
}
