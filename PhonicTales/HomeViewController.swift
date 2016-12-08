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
    
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.setImage(UIImage(named: "Home"), for: .normal)
        
        let homeBarButton = UIBarButtonItem()
        homeBarButton.customView = button
        self.navigationItem.leftBarButtonItem = homeBarButton
        homeBarButton.isEnabled = false
       // button.addTarget(self, action: #selector(pressButton), for: .allEvents)
      //  pressButton(sender: barButton)
        
        // Adding black logout button to top
        let rightUIBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem  = rightUIBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
    }
    
    func pressButton(sender: AnyObject) {
        let disableMyButton = sender as? UIButton
        disableMyButton?.isEnabled = false
    }

   }
