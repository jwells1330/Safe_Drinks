//
//  BeginSafelyDrinkingViewController.swift
//  Safe Drinks
//
//  Created by Jake Wells on 11/27/16.
//  Copyright © 2016 Allen, Ashwell, and Wells. All rights reserved.
//

import UIKit

class BeginSafelyDrinkingViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bacLabel: UILabel!
    @IBOutlet weak var drinkCounterLabel: UILabel!
    
    var userName: String = ""
    var defaults: UserDefaults = UserDefaults.standard

    let dateObj = DateObject(0,0,Date())


    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = userName
        let user = getUser()
        user.addToHistory(dateObj)
        
    }

    @IBAction func addSameDrink(_ sender: UIButton) {
        
        drinkCounterLabel.text = "You have had \(dateObj.getDrink()) drinks tonight"
    }
    func getUser() -> User{
        let decoded = defaults.object(forKey: "\(userName)") as! Data
        let user = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
        return user
    }

    @IBAction func addDrink(_ sender: Any) {
    }
}
