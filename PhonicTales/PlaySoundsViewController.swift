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
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var stop: UIButton!
    @IBOutlet weak var navBar: UINavigationBar!
    
    @IBOutlet weak var saveInfo: UILabel!

    let synthesizer = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        
        play.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        stop.imageView?.contentMode = UIViewContentMode.scaleAspectFit

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
    @IBAction func playSound(){
        Convenience.sharedInstance().play(synthesizer: synthesizer, button: play)
    }
    
    // stops text as sound
    @IBAction func stopSound(){
       Convenience.sharedInstance().stop(synthesizer: synthesizer, button: play)
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
















