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
        //print( self.text)
        
        // Do any additional setup after loading the view.
    }

    
    // sets the playback
    func recordedStory(){
        let utterance = AVSpeechUtterance(string: self.text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        self.synthesizer.speak(utterance)
    }
    
    // plays text as sound
    @IBAction func playSound(){
//        for (index, word) in Convenience.sharedInstance().usersAnswers.enumerated() {
//            Convenience.sharedInstance().text = Convenience.sharedInstance().text.replacingOccurrences(of: "<\(index)>", with: word)
//        }
        recordedStory()
    }
    
    // stops text as sound
    @IBAction func stopSounds(){
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }



}
