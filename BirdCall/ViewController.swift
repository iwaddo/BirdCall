//
//  ViewController.swift
//  BirdCall
//
//  Created by Ian Waddington on 24/09/2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var youPressedButton: UILabel!

    var audioPlayer: AVAudioPlayer!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func birdButtonPressed(_ sender: UIButton) {
        youPressedButton.text = "You pressed button \(sender.tag)"
        
        if let sound = NSDataAsset(name: "bird" + String(sender.tag)) {
            do {
               try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            } catch {
                print("ERROR: \(error.localizedDescription)Could not initialize AVAudioPlayer Object")
            }

        } else {
            print("ERROR: Could not read data from sound file")
        }

    }
    
}

