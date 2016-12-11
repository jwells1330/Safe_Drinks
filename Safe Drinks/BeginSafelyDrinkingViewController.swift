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
    
    @IBOutlet weak var warningLabel: UILabel!
    var userName: String = ""
    var defaults: UserDefaults = UserDefaults.standard

    var dateObj = DateObject(0,0,NSDate())
    var weight = 0
    var female = true
    
    var history: [DateObject] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = userName
        let user = getUser()
        weight = user.getWeight()
        female = user.getFemale()
        
        if defaults.object(forKey: "\(userName)History") == nil{
            defaults.set(history, forKey: "\(userName)History")
        }else{
            let archivedHistory = defaults.object(forKey: "\(userName)History") as? NSData
            history = (NSKeyedUnarchiver.unarchiveObject(with: archivedHistory as! Data) as? [DateObject])!
        }
        
        
        var stillDrinking = false
        
        for dateObject in history{
            if Calendar.current.component(.day, from: Date()) == Calendar.current.component(.day, from: dateObject.date as Date){
                dateObj = dateObject
                stillDrinking = true
            }
        }
        if !stillDrinking{
        history.append(dateObj)
        }else{
            drinkCounterLabel.text = "You have had \(dateObj.getDrink()) drink(s)"
            bacLabel.text = "Estimated BAC is \(dateObj.getBAC())"
        }
        
    }
    
    func getUser() -> User{
        let decoded = defaults.object(forKey: "\(userName)") as! Data
        let user = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
        return user
    }

    @IBAction func addDrink(_ sender: Any) {
        dateObj.addDrink()
        dateObj.setBAC(weight, female)
        drinkCounterLabel.text = "You have had \(dateObj.getDrink()) drink(s)"
        bacLabel.text = "Estimated BAC is \(dateObj.getBAC())"
        
        history.removeLast()
        history.append(dateObj)
        defaults.set(archiveHistory(), forKey: "\(userName)History")
        
        if dateObj.BAC >= 0.06 && dateObj.BAC <= 0.08{
            let alert = UIAlertController(title: "Warning", message: "Please don't drive.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
            warningLabel.text = "Please don't drive."
        }
        if dateObj.BAC >= 0.18 && dateObj.BAC <= 0.23{
            let alert2 = UIAlertController(title: "Warning", message: "Please stop drinking.", preferredStyle: UIAlertControllerStyle.alert)
            alert2.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert2, animated: true, completion: nil)
        }
        if dateObj.BAC >= 0.23 && dateObj.BAC <= 0.28{
            let alert3 = UIAlertController(title: "Warning", message: "Please consider calling 911.", preferredStyle: UIAlertControllerStyle.alert)
            alert3.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert3, animated: true, completion: nil)
        }
        if dateObj.BAC >= 0.28 {
            let alert4 = UIAlertController(title: "Warning", message: "Call 911.", preferredStyle: UIAlertControllerStyle.alert)
            alert4.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alert4, animated: true, completion: nil)
        }
    }
        func archiveHistory() -> NSData{
            let archivedArray = NSKeyedArchiver.archivedData(withRootObject: history as NSArray)
            return archivedArray as NSData
        }
}
