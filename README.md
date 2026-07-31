# Tuunss – Open Guitar Tuner

A lightweight iOS guitar tuner built with SwiftUI and AVAudioEngine. Tune multiple strings simultaneously with precision. No noise, just results.

<div style="display: flex; gap: 10px; justify-content: center;"> <img src="https://github.com/Vito2211/GuitarTuner/blob/main/image/screen1.png?raw=true" width="180" /> <img src="https://github.com/Vito2211/GuitarTuner/blob/main/image/screen2.png?raw=true" width="180" /> <img src="https://github.com/Vito2211/GuitarTuner/blob/main/image/screen3.png?raw=true" width="180" /> </div>

## Features

- **Multiple instruments** – Built-in presets for Guitar, Ukulele, Bass
- **Cents precision** – Shows exact deviation from target frequency
- **Autocorrelation algorithm** – Accurate pitch detection even in moderate noise
- **Customizable reference pitch** – Change A4 from the standard 440 Hz
- **Light & Dark modes** – Settings panel with appearance control
- **Frequency visualization** – Real-time waveform bar indicator
- **No internet required** – Works completely offline
- **Open source** – Full transparency

## Tech Stack

- **Language:** Swift
- **UI Framework:** SwiftUI
- **Audio Processing:** AVAudioEngine (4096 buffer size)
- **Pitch Detection:** Autocorrelation Function (ACF)
- **Platforms:** iOS 17.6+

## How It Works

### Audio Capture
- Captures audio via `AVAudioEngine.inputNode` with 4096-sample buffer
- Computes RMS (root mean square) to detect silence and filter noise

### Pitch Detection
- **Autocorrelation algorithm** finds the fundamental frequency by comparing audio samples with delayed versions of themselves
- More robust than FFT for guitar and acoustic instruments
- Minimum frequency: ~70 Hz (low E on bass)
- Maximum frequency: ~1 kHz (covers all standard instruments)

### Note Conversion
- Converts detected frequency to MIDI note
- Calculates octave and note name (C, C#, D, etc.)
- Computes **cents** – precise offset from target frequency
  - ±50 cents = perfectly in-tune (perceptually acceptable)
  - Helps you dial in precision tuning

### UI State
- All 6 strings display their target note and real-time offset
- Individual sliders show tuning deviation for each string
- Central display highlights the currently detected note

## Usage

1. **Launch the app** and grant microphone access
2. **Select your instrument** (Guitar/Ukulele/Bass) in Settings
3. **Play a string** near your microphone
4. **Adjust until the needle centers** on the frequency bar and the string slider is in-tune
5. **Repeat for all strings**

## Architecture

```
AudioManager (AVAudioEngine setup)
    ↓
PitchDetector (Autocorrelation ACF)
    ↓
NoteConverter (Frequency → MIDI → Note + Cents)
    ↓
UI State (SwiftUI @ObservableObject)
```

### Key Components

**AudioManager.swift**
- Initializes AVAudioEngine with `.playAndRecord` category
- Installs tap on input node (4096 buffer)
- Passes raw samples to PitchDetector

**PitchDetector.swift**
- Implements autocorrelation-based frequency detection
- Scans delay range 44100/1000 to 44100/70 Hz
- Filters out noise via RMS threshold (0.002)

**NoteConverter.swift**
- Converts frequency → MIDI number → note name + octave
- Calculates cents from perfect pitch using `1200 * log2(detected/perfect)`

**InstrumentData.swift**
- Defines preset tuning strings for each instrument
- Easy to add new instruments (drop-D, open tunings, etc.)

## Settings

- **Appearance:** System (respects device light/dark mode)
- **Reference Pitch:** Adjustable (default 440 Hz A4)
- More options coming soon

## Current State

(complete) Core tuning engine works  
(complete) Multi-string display  
(complete) Settings panel  
(complete) Dark mode support  
v Refining cross-device layouts (iPhone/iPad compatibility)

## Known Limitations

- Requires microphone access
- Works best in quiet environments (background noise reduces accuracy)
- Currently optimized for 44.1 kHz sample rate
- ACF algorithm works best with sustained, clear tones

## Future Plans

- [ ] Support for more tunings (Drop-D, DADGAD, etc.)
- [ ] Custom instrument profiles
- [ ] Metronome integration
- [ ] Better handling of harmonics and overtones

## Installation

1. Clone the repo:
```bash
git clone https://github.com/Vito2211/GuitarTuner.git
cd GuitarTuner
```

2. Open in Xcode:
```bash
open GuitarTuner.xcodeproj
```

3. Select target device and run (⌘R)

4. Grant microphone permission when prompted

## Known Issues & Fixes

**AVAudioEngine initialization on simulator**  
- Fixed by properly sequencing `setupAudioSession()` → `testAudio()` (engine start)
- See: `AudioManager.swift`

**Cross-device layout compatibility**  
- Currently working through SwiftUI adaptive layouts for iPhone/iPad
- String sliders scaling with device orientation

## Contributing

Bug reports and feature requests welcome:
- Open an issue to discuss
- Submit a PR with improvements

## License

Open source – see LICENSE for details.

## Connect

- **GitHub:** [@Vito2211](https://github.com/Vito2211)
- **Project:** [GuitarTuner](https://github.com/Vito2211/GuitarTuner)

---
