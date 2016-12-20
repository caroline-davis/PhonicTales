//
//  LoginViewController.swift
//  PhonicTales
//
//  Created by Caroline Davis on 18/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit

import FacebookCore
import FacebookLogin

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.indicator.hidesWhenStopped = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if Convenience.sharedInstance().isLoggedIn() {
            completeLogin()
        } else {
            self.addAuthButton()
        }
    }
    
    func clicked() {
        self.indicator.startAnimating()
        Convenience.sharedInstance().loginButtonClicked(sender: self) {
            (success) in
            if success {
                self.completeLogin()
                self.indicator.stopAnimating()
            } else {
                Convenience.sharedInstance().alertMessage(errorMessage: "Your login was unsuccessful, please try again", sender: self)
                self.indicator.stopAnimating()
            }
        }
    }
    
    private func completeLogin() {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "NavigationController") as! UINavigationController
        self.present(controller, animated: false, completion: nil)
    }
    
    func addAuthButton() {
        // code for fb button design
        let buttonWidth: Int = Int(self.view.frame.size.width)
        let buttonHeight: Int = Int(self.view.frame.size.height)
        
        let myLoginButton = UIButton(type: .custom)
        myLoginButton.setTitle("Login with Facebook", for: .normal)
        myLoginButton.setTitleColor(UIColor.white, for: UIControlState.normal)
        myLoginButton.setTitleColor(UIColor(red:0.27, green:0.36, blue:0.61, alpha:1.0), for: UIControlState.highlighted)
        myLoginButton.backgroundColor = UIColor(red:0.27, green:0.36, blue:0.61, alpha:1.0)
        myLoginButton.layer.cornerRadius = 5
        myLoginButton.frame = CGRect(x: 0, y: 0, width: 200, height: 40);
        myLoginButton.center = CGPoint(x: buttonWidth / 2, y: buttonHeight - 80);
        myLoginButton.titleLabel!.font = UIFont(name: "Helvetica Bold", size: 16)
        
        // get user to login to the fb via the fb button
        myLoginButton.addTarget(self, action: #selector(clicked), for: .touchUpInside)
        view.addSubview(myLoginButton)
        
        myLoginButton.translatesAutoresizingMaskIntoConstraints = false
        myLoginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        myLoginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        myLoginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    
}

