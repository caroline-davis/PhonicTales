//
//  QuestionsViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var question: UILabel!

    var questions: [String] = []
    var questionIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chooseStoryTemplate()
        self.answer.delegate = self
        pickOutQuestion()
    }
    
    func chooseStoryTemplate(){
        var selectedStory = Convenience.sharedInstance().selectedStory
        
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
        Convenience.sharedInstance().usersAnswers.append(textField.text!)
        pickOutQuestion()
        textField.text = ""
    }
    

}
