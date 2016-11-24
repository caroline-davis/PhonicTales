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
        if let accessToken = AccessToken.current {
            // User is logged in, use 'accessToken' here.
            
            self.dismiss(animated: true, completion: {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController")
                self.present(vc!, animated: true, completion: nil)
            })
            
            
        } else {
            let loginButton = LoginButton(readPermissions: [ .publicProfile ])
            loginButton.center = view.center
            
            view.addSubview(loginButton)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }


}

