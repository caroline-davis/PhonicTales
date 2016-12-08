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

    let synthesizer = AVSpeechSynthesizer()
    var text = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.text = Convenience.sharedInstance().text
        recordedStory()
        
        // Do any additional setup after loading the view.
    }

    
    // sets the playback
    func recordedStory(){
        let utterance = AVSpeechUtterance(string: self.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        self.synthesizer.speak(utterance)
    }


}
