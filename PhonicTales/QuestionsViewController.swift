//
//  QuestionsViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit
import AVFoundation

class QuestionsViewController: UIViewController, AVSpeechSynthesizerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var sounds: UIButton!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var question: UILabel!
    
    let synthesizer = AVSpeechSynthesizer()
    var usersAnswers:[String] = []
    
    var text = "Yesterday I left my house and went for a walk with my pet <0>, named <1>, to buy some delicious <2>.  It was a <3> day so I decided to put on my best <4>. Little <1> and I <5> all the way to the store and saw a <6> along the way.  ,<1> chased the <6> into the store and the <6> broke a <7>. The <6> looked ANGRY and ran away. I apologised to the shopkeeper about the <7> and he told me it was okay because he had won <8> dollars that day and could pay for the repairs. I asked the shopkeeper for some <2> and headed off to the park with <1>. As I began to eat my <2> I saw the <6> sitting amongst the grass. I asked him to come over to share the <2>. He <9> over and declined the <2> and said “What am I a <0> ?”. The <6> was never seen again."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answer.delegate = self
    }
    
    // when enter is pressed keyboard is dismissed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // when user is finished with text, the word will be saved and inserted into array
    func textFieldDidEndEditing(_ textField: UITextField) {
        usersAnswers.append(textField.text!)
        print(usersAnswers)
    }
    
    // plays text
    @IBAction func record(){
        for (index, word) in usersAnswers.enumerated() {
            text = text.replacingOccurrences(of: "<\(index)>", with: word)
        }
        recordedStory(text: text)
    }
    
    // sets the playback
    func recordedStory(text: String){
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
        utterance.rate = 0.4
        
        self.synthesizer.speak(utterance)
    }
}
