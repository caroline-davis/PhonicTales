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

    override func viewDidLoad() {
        super.viewDidLoad()
        if AccessToken.current != nil {
            print(AccessToken.current?.authenticationToken)
            // if user is logged in, use current 'accessToken' and go to home view controller
            self.dismiss(animated: true, completion: {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                self.present(vc!, animated: true, completion: nil)
            })
        } else {
            
            // get user to login to the fb via the fb button
            let buttonWidth: Int = Int(self.view.frame.size.width)
            let buttonHeight: Int = Int(self.view.frame.size.height)
            
            let myLoginButton = UIButton(type: .custom)
            myLoginButton.setTitle("Login to Facebook", for: .normal)
            myLoginButton.setTitleColor(UIColor.white, for: UIControlState.normal)
            myLoginButton.setTitleColor(UIColor(red:0.27, green:0.36, blue:0.61, alpha:1.0), for: UIControlState.highlighted)
            myLoginButton.backgroundColor = UIColor(red:0.27, green:0.36, blue:0.61, alpha:1.0)
            myLoginButton.layer.cornerRadius = 5
            myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40);
            myLoginButton.center = CGPoint(x: buttonWidth / 2, y: buttonHeight - 100);
            myLoginButton.titleLabel!.font = UIFont(name: "Helvetica Bold", size: 16)
            
            
            myLoginButton.addTarget(self, action: #selector(self.loginButtonClicked), for: .touchUpInside)
            view.addSubview(myLoginButton)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func loginButtonClicked() {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
            }
        }
    }

    


}

