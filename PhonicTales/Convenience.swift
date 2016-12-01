//
//  Convenience.swift
//  PhonicTales
//
//  Created by Caroline Davis on 28/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit

class Convenience: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var usersAnswers:[String] = []
    var text: String = ""
    var selectedStory = ""
  //story template text and questions
    var storyTemplates = [
        "Animal": [
            "text": "Yesterday I left my house and went for a walk with my pet <0>, named <1>, to buy some delicious <2>.  It was a <3> day so I decided to put on my best <4>. Little <1> and I <5> all the way to the store and saw a <6> along the way.  ,<1> chased the <6> into the store and the <6> broke a <7>. The <6> looked angry and ran away. I apologised to the shopkeeper about the <7> and he told me it was okay because he had won <8> dollars that day and could pay for the repairs. I asked the shopkeeper for some <2> and headed off to the park with <1>. As I began to eat my <2> I saw the <6> sitting amongst the grass. I asked him to come over to share the <2>. He <9> over and declined the <2> and said “What am I, a <0> ?,”. The <6> was never seen again.",
            "questions": [
                "What is your favourite animal?",
                "Type in a name?",
                "What is your favourite food?",
                "Name an adjective",
                "Type in an item of clothing",
                "Name an action verb",
                "Type in a different animal",
                "Name an object",
                "Type in a number",
                "Name a different action verb"
            ]
        ]
    ]
    
    // alert message pop ups
    func alertMessage(errorMessage: String, sender: AnyObject) {
        let alertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
            print("Cancel")
        }
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (result : UIAlertAction) -> Void in
                print("OK")
                return
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        sender.present(alertController, animated: true, completion: nil)
    }

    
    
    // shared instance singleton
    class func sharedInstance() -> Convenience {
        struct Singleton {
            static var sharedInstance = Convenience()
        }
        return Singleton.sharedInstance
    }

    
    
    
}