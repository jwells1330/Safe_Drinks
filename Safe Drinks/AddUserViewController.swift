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
    var userNames: [String] = []

    @IBOutlet weak var sexSlider: UISegmentedControl!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func addUser(_ sender: Any) {
        let alert = UIAlertController(title: "Weight", message: "Please Enter a valid weight.", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        
        var female: Bool
        if sexSlider.selectedSegmentIndex == 0{
             female = false
        }else{
             female = true
        }

        if Int(weightTextField.text!) != nil{
            let newUser = User(nameTextField.text!, Int(weightTextField.text!)!, female)
            userNames = defaults.object(forKey: "userNames") as! [String]
            userNames.append(newUser.getName())
            defaults.set(userNames, forKey: "userNames")
            let encodedUser: Data = NSKeyedArchiver.archivedData(withRootObject: newUser)
            defaults.set(encodedUser, forKey: "\(newUser.getName())")
        }else{
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if Int(weightTextField.text!) != nil{
            return true;
        }else{
            return false;
        }
    }
}
