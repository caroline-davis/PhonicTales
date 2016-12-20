//
//  Facebook.swift
//  PhonicTales
//
//  Created by Caroline Davis on 20/12/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import Foundation
import FacebookLogin
import FacebookCore

extension Convenience {
    
    @objc func loginButtonClicked(sender: AnyObject, completionHandler: @escaping (_ success: Bool) -> Void) {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: sender as? UIViewController) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
                completionHandler(false)
            case .cancelled:
                print("User cancelled login.")
                completionHandler(false)
            case .success:
                print("Logged in!")
                completionHandler(true)
            }
        }
    }
    
    func isLoggedIn() -> Bool {
        if AccessToken.current != nil {
            return true
        }
        return false
    }
    
    func logoutButtonClicked() {
        LoginManager().logOut()
        
    }
}
