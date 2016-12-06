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

    @IBOutlet weak var homeButton: UIBarButtonItem!
    @IBOutlet weak var sounds: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var navBar: UINavigationBar!
    

    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    // makes the nav bar thicker
    override func viewWillAppear(_ animated: Bool) {
        self.navBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 60.00)
    }

    
    // plays text as sound
    @IBAction func playSound(){
        for (index, word) in Convenience.sharedInstance().usersAnswers.enumerated() {
            Convenience.sharedInstance().text = Convenience.sharedInstance().text.replacingOccurrences(of: "<\(index)>", with: word)
        }
        recordedStory(text: Convenience.sharedInstance().text)
    }
    
    // stops text as sound
    @IBAction func stopSounds(){
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
   // synthesizer.pauseSpeaking(at: AVSpeechBoundary.word)
   
    
    // sets the playback
    func recordedStory(text: String){
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        self.synthesizer.speak(utterance)
    }
    
    // getting the data ready to be saved
    func getData(){
        let currentDate = Date()
        let completedStory = Convenience.sharedInstance().text
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let story = Story(context: context)
        story.storyText = completedStory
        story.storyCreationDate = currentDate as NSDate?
        
       //save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    

}
















