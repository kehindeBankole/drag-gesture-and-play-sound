//
//  AudioPlayer.swift
//  drag-and-sound
//
//  Created by kehinde on 26/12/2023.
//

import Foundation
import AVFoundation
var audioPlayer : AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("ERROR")
        }
    }
}

