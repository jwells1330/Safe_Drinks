//
//  AddUserViewController.swift
//  Safe Drinks
//
//  Created by Jake Wells on 11/27/16.
//  Copyright © 2016 Allen, Ashwell, and Wells. All rights reserved.
//

import UIKit

class AddUserViewController: UIViewController {
    
    var defaults: UserDefaults = UserDefaults.standard
    var userCount: Int = 0
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func addUser(_ sender: Any) {
        let newUser = User(nameTextField.text!, Int(weightTextField.text!)!)
        defaults.set(newUser, forKey: "/(userCount)")
    }
}
