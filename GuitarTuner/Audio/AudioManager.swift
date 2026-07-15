//
//  AudioManager.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 12.07.2026.
//
import AVFoundation


final class AudioManager {
    let engine = AVAudioEngine()
    
    
    func requestPermission(completion: @escaping () -> Void) {
        AVAudioApplication.requestRecordPermission { granted in
            print("Разрешение:", granted)
            if granted {
                completion()
            }
        }
    }
    
    
    func testAudio() {
        engine.stop()
        
        let input = engine.inputNode
        
        input.removeTap(onBus: 0)
        
        let format = input.inputFormat(forBus: 0)

        input.installTap(
            onBus: 0,
            bufferSize: 1024,
            format: format
        ) { buffer, time in
            
            guard let data = buffer.floatChannelData else {
                return
            }

            let samples = data[0]

            print(samples[0])
        }

        do {
            try engine.start()
            print("Engine started")
        } catch {
            print(error)
        }
    }
    
    
    func setupAudioSession() {
        let input = engine.inputNode
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(.record)
            try session.setActive(true)
            print("Session active")
        } catch {
            print(error)
        }
        
        print(input.inputFormat(forBus: 0))
    }
}
