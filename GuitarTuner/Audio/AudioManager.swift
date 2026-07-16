//
//  AudioManager.swift
//  GuitarTuner
//
//  Created by  Viktor Pavliuk on 12.07.2026.
//
import AVFoundation
import Combine

final class AudioManager: ObservableObject {
    let engine = AVAudioEngine()
    private let detector = PitchDetector()
    
    
    func requestPermission(completion: @escaping () -> Void) {
        AVAudioApplication.requestRecordPermission { granted in
            
            print("Permission:", granted)
            
            if granted {
                DispatchQueue.main.async {
                    completion()
                }
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
            bufferSize: 4096,
            format: format
        ) { [weak self] buffer, time in
            
            guard let self else {
                return
            }
            
            guard let data = buffer.floatChannelData else {
                return
            }
            
            let samples = data[0]
            
            self.detector.detect(
                samples: samples,
                count: Int(buffer.frameLength)
            )
        }

        do {
            try engine.start()
            print("Engine started")
        } catch {
            print(error)
        }
    }
    
    
    func setupAudioSession() {
        
        
        let session = AVAudioSession.sharedInstance()
        
        do {
            try session.setCategory(
                .playAndRecord,
                mode: .measurement,
                options: [.allowBluetoothHFP]
            )
            try session.setActive(true)
            print("Session active")
        } catch {
            print(error)
        }
        let input = engine.inputNode
        print(input.inputFormat(forBus: 0))
    }
}
