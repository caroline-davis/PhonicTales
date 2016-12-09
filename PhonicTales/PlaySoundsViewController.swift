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
    
    //stops sound when user leaves vc
    override func viewWillDisappear(_ animated: Bool) {
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }

    
    // add the users words into the string
    func insertWords(){
        for (index, word) in Convenience.sharedInstance().usersAnswers.enumerated() {
            Convenience.sharedInstance().text = Convenience.sharedInstance().text.replacingOccurrences(of: "<\(index)>", with: word)
        }
    }
   
    // sets the playback and plays the text as sound
    @IBAction func recordedStory(){
        Convenience.sharedInstance().play(synthesizer: synthesizer, button: sounds)
    }
    
    // stops text as sound
    @IBAction func stopSounds(){
        synthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
        let image = UIImage(named: "Play") as UIImage!
        sounds.setImage(image, for: .normal)
    }
    

    
    // getting the data ready to be saved
    func getData(){
        insertWords()
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
















