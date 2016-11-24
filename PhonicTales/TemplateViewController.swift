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
        
        // Adding black logout button to top
        let testUIBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem  = testUIBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black


        // Do any additional setup after loading the view.
    }



}
