//
//  Vibration.swift
//  Brady WatchKit Extension
//
//  Created by Aldo Di Giovanni on 07/06/22.
//

import WatchKit
import AVFoundation

class Vibration {
    static var audioPlayer: AVAudioPlayer?
    
    static func call() {
        if let path = Bundle.main.path(forResource: "empty", ofType: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("ERROR")
            }
        }
        WKInterfaceDevice.current().play(.success)
    }
}
