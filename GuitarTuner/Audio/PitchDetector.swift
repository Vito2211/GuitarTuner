//
//  Untitled.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 12.07.2026.
//

import Foundation

final class PitchDetector{
    
    func detect(samples: UnsafePointer<Float>, count: Int) {
        var sum: Float = 0
        
        
        
        for i in 0..<count{
            let sample = samples[i]
            sum += sample * sample
        }
        
        let rms = sqrt(sum / Float(count))
        
        convertToHz(
            rms: rms,
            samples: samples,
            count: count
        )
        
    }
    
    func convertToHz(rms: Float, samples: UnsafePointer<Float>, count: Int) {
        
        if rms < 0.002 {
            print("Слишком тихо")
            return
        }
        
        var bestSimilarity: Float =  -Float.infinity
        var bestDelay = 0
        
        let minDelay = Int(44100 / 1000)

        let maxDelay = Int(44100 / 70)

        for delay in minDelay..<min(maxDelay, count) { 

            var similarity: Float = 0

            for i in 0..<(count - delay) {
                similarity += samples[i] * samples[i + delay]
            }

            if similarity > bestSimilarity {
                bestSimilarity = similarity
                bestDelay = delay
            }
        }
        
        if bestDelay == 0 {
            print("Не удалось определить частоту")
            return
        }
        
        
        
        
        
        print("Frequency:", (44100.0 / Double(bestDelay)), "Hz")
        print(bestDelay)
        
    }
    
    
    
    
    
}
