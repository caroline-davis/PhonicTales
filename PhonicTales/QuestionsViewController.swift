//
//  QuestionsViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate{
    
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var question: UILabel!

    var questions: [String] = []
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answer.delegate = self
        chooseStoryTemplate()
        pickOutQuestion()
        
        // clears text incase user goes back before saving phonic tale
        Convenience.sharedInstance().usersAnswers = []
    }
    
    func chooseStoryTemplate(){
        let selectedStory = Convenience.sharedInstance().selectedStory
        
        if let storyChoice = Convenience.sharedInstance().storyTemplates[selectedStory] {
            if let storyText = storyChoice["text"] {
                Convenience.sharedInstance().text = storyText as! String
            }
            if let storyQuestions = storyChoice["questions"] {
                questions = storyQuestions as! [String]
            }
        }
    }

    func pickOutQuestion() {
        if questionIndex <= questions.count - 1 {
            question.text = questions[questionIndex]
            questionIndex += 1
        } else if questionIndex >= questions.count - 1 {
            let controller = self.storyboard!.instantiateViewController(withIdentifier: "PlaySoundsViewController")
            self.present(controller, animated: true, completion: nil)
        }
    }
    
 
    // alert msg pops up if they forget to put in an answer
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text == "" {
            
            Convenience.sharedInstance().alertMessage(errorMessage: "Oops! You forgot to put in an answer", sender: self)
        } else {
            Convenience.sharedInstance().usersAnswers.append(textField.text!)
            pickOutQuestion()
            textField.text = ""
        }
        return false
    }
    
    
    
}
