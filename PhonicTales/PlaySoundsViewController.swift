//
//  PlaySoundsViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController, AVSpeechSynthesizerDelegate {

    
    @IBOutlet weak var sounds: UIButton!
    
    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // plays text
    @IBAction func playSound(){
        for (index, word) in Convenience.sharedInstance().usersAnswers.enumerated() {
            Convenience.sharedInstance().text = Convenience.sharedInstance().text.replacingOccurrences(of: "<\(index)>", with: word)
        }
        recordedStory(text: Convenience.sharedInstance().text)
    }
    
    // sets the playback
    func recordedStory(text: String){
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        self.synthesizer.speak(utterance)
    }

}
