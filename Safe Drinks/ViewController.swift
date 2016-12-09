//
//  ViewController.swift
//  Safe Drinks
//
//  Created by Jake Wells on 11/27/16.
//  Copyright © 2016 Allen, Ashwell, and Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var users = Users()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tester()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tester(){
        let test = User("Jake", 230)
        users.addUser(test)
    }
    
    
}

