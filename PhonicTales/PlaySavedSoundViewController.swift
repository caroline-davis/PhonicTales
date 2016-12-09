//
//  PlaySavedSoundViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 8/12/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySavedSoundViewController: UIViewController, AVSpeechSynthesizerDelegate {

    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var stop: UIButton!
    
    let synthesizer = AVSpeechSynthesizer()
    var text = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.text = Convenience.sharedInstance().text
    }
    
    //stops sound when user leaves vc
    override func viewWillDisappear(_ animated: Bool) {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }

    // sets the playback
    @IBAction func playSound(){
        Convenience.sharedInstance().play(synthesizer: synthesizer, button: play)
    }
    
    // stops text as sound
    @IBAction func stopSound(){
        Convenience.sharedInstance().stop(synthesizer: synthesizer, button: play)
    }
    

}
