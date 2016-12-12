//
//  ViewController.swift
//  Safe Drinks
//
//  Created by Jake Wells on 11/27/16.
//  Copyright © 2016 Allen, Ashwell, and Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var defaults: UserDefaults = UserDefaults.standard
    var userNames: [String] = []
    var userName = "Please Select a User"
    @IBOutlet weak var selectedUser: UILabel!
    var userSelected = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if defaults.object(forKey: "userNames") == nil{
            defaults.set(userNames, forKey: "userNames")
        }else{
            userNames = defaults.object(forKey: "userNames") as! [String]
        }
        selectedUser.text = userName
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBeginDrinkingView"{
            let destination = segue.destination as! BeginSafelyDrinkingViewController
            destination.userName = self.userName
        } else if (segue.identifier == "showHistory"){
            let destination = segue.destination as! HistoryViewController
            destination.userName = self.userName
        }
        
    }
    @IBAction func reset(_ sender: Any) {
        userNames.removeAll()
        defaults.set(userNames, forKey: "userNames")
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "showBeginDrinkingView" || identifier == "showHistory"{
            if userSelected {
                return true;
            }else{
                let alert = UIAlertController(title: "Select User", message: "Please Select a User", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return false;
            }
        }else{
            return true;
        }
    }
}

