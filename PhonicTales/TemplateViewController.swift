//
//  TemplateViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit

class TemplateViewController: UIViewController {
    
    @IBOutlet weak var paw: UIButton!
    @IBOutlet weak var sword: UIButton!
    @IBOutlet weak var food: UIButton!
    @IBOutlet weak var heart: UIButton!
    @IBOutlet weak var anchor: UIButton!
    @IBOutlet weak var ghost: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func buttonPushed (sender: UIButton) {
        let checkButtonName = sender.restorationIdentifier!
        print(checkButtonName)
        switch checkButtonName {
        case "Animal": Convenience.sharedInstance().selectedStory = "Animal"
        case "Fight": Convenience.sharedInstance().selectedStory = "Fight"
        case "Food": Convenience.sharedInstance().selectedStory = "Food"
        case "Love": Convenience.sharedInstance().selectedStory = "Love"
        case "Ship": Convenience.sharedInstance().selectedStory = "Ship"
        case "Ghost": Convenience.sharedInstance().selectedStory = "Ghost"
        default:
            break
        }
        
        // replaces dispatch dispatch_async(dispatch_get_main_queue()) to make sure view is in correct queue.
        DispatchQueue.main.async { () -> Void in
            self.performSegue(withIdentifier: "ButtonSegue", sender: UIButton.self)
        }

    }
    
}
