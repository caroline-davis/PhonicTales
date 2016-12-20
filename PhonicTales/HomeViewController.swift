//
//  HomeViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 22/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//


import UIKit
import FacebookCore
import FacebookLogin

class HomeViewController: UIViewController {
    
    @IBOutlet weak var saved: UIButton!
    @IBOutlet weak var createNew: UIButton!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.indicator.hidesWhenStopped = true
        
        // Adding left home button to nav bar
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 50, height: 30)
        button.setImage(UIImage(named: "Home"), for: .normal)
        
        let homeBarButton = UIBarButtonItem()
        homeBarButton.customView = button
        self.navigationItem.leftBarButtonItem = homeBarButton
        homeBarButton.isEnabled = false
        
        // Adding right logout button to nav bar
        let rightUIBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logout(sender:)))
        self.navigationItem.rightBarButtonItem  = rightUIBarButtonItem
        self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
        
    }
    
    // logs user out of facebook and takes them back to the login screen
    func logout(sender: UIBarButtonItem) {
        self.indicator.startAnimating()
        Convenience.sharedInstance().logoutButtonClicked()
        DispatchQueue.main.async { () -> Void in
            self.presentingViewController!.dismiss(animated: true, completion: nil)
        }
    }
    
}
