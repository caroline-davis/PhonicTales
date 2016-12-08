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
    
    // add the users words into the string
    func insertWords(){
        for (index, word) in Convenience.sharedInstance().usersAnswers.enumerated() {
            Convenience.sharedInstance().text = Convenience.sharedInstance().text.replacingOccurrences(of: "<\(index)>", with: word)
        }
    }
   
    // sets the playback and plays the text as sound
    @IBAction func recordedStory(){
        let utterance = AVSpeechUtterance(string: Convenience.sharedInstance().text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        self.synthesizer.speak(utterance)
    }
    
    // stops text as sound
    @IBAction func stopSounds(){
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    
    // synthesizer.pauseSpeaking(at: AVSpeechBoundary.word)

    
    // getting the data ready to be saved
    func getData(){
        insertWords()
        let currentDate = Date()
        let completedStory = Convenience.sharedInstance().text
        print(completedStory)
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let story = Story(context: context)
        story.storyText = completedStory
        story.storyCreationDate = currentDate as NSDate?
        
       //save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
    }
    
    

}
















