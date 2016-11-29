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
    var text = Convenience.sharedInstance().text
    var questions = Convenience.sharedInstance().questions
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answer.delegate = self
        pickOutQuestion()
    }

    
    func pickOutQuestion() {
        print(questions.count, questionIndex)
        if questionIndex <= questions.count - 1 {
            question.text = questions[questionIndex]
            questionIndex += 1
        } else if questionIndex >= questions.count - 1 {
            let controller = self.storyboard!.instantiateViewController(withIdentifier: "PlaySoundsViewController")
            self.present(controller, animated: true, completion: nil)
        }
    }
 
    // when enter is pressed keyboard is dismissed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // when user is finished with text, the word will be saved and inserted into array
    func textFieldDidEndEditing(_ textField: UITextField) {
        usersAnswers.append(textField.text!)
        pickOutQuestion()
        print(question)
        print(usersAnswers)
        textField.text = ""
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
