//
//  HomeViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//


import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var saved: UIButton!
    @IBOutlet weak var createNew: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Adding black logout button to top
        let leftUIBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem  = leftUIBarButtonItem
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
    }
}
