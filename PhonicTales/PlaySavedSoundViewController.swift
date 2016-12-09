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

    
    // sets the playback
    @IBAction func playRecordedStory(){
        Convenience.sharedInstance().play(synthesizer: synthesizer)
        
    }
    
    
    // stops text as sound
    @IBAction func stopSounds(){
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        
    }
    
    func buttonImageSwap(button: UIButton) {
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.setImage(UIImage(named: "Play"), for: .normal)
    }



}
