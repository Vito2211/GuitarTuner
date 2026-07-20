//
//  Note.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 12.07.2026.
//

import Foundation

final class NoteConverter { 
    
    func convert(frequency: Double) {
        let A4 = 440.0
        
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
        
        print("\(notes[noteIndex])\(octave)")
        
        detectCenc(midi: midi, frequency: frequency)
        
    }
    
    func detectCenc(midi: Int, frequency: Double) {
        
        let perfectFrequency = 440.0 * pow(2.0, Double(midi - 69) / 12.0)
        
        let cents = 1200 * log2(frequency / perfectFrequency)
        print("Cents:", cents)

        
    }
    
    
}
