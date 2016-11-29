//
//  Convenience.swift
//  PhonicTales
//
//  Created by Caroline Davis on 28/11/2016.
//  Copyright © 2016 Caroline Davis. All rights reserved.
//

import UIKit

class Convenience: UIViewController{

  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // shared instance singleton
    class func sharedInstance() -> Convenience {
        struct Singleton {
            static var sharedInstance = Convenience()
        }
        return Singleton.sharedInstance
    }

    
    
    
}
