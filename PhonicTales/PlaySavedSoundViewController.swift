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
        synthesizer.delegate = self
        play.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        stop.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    
    //stops sound when user leaves vc
    override func viewWillDisappear(_ animated: Bool) {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    // returns image to play when sound finishes
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        let image = UIImage(named: "Play") as UIImage!
        play.setImage(image, for: .normal)
    }
    
    // sets the playback
    @IBAction func playSound(){
        Convenience.sharedInstance().play(synthesizer: synthesizer, button: play)
    }
    
    // when sound is played straight to the end, at the end we need to make the button go back to the play button
    
    // stops text as sound
    @IBAction func stopSound(){
        Convenience.sharedInstance().stop(synthesizer: synthesizer, button: play)
    }
    
    
}
