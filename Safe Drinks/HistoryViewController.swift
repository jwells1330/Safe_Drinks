//
//  HistoryViewController.swift
//  Safe Drinks
//
//  Created by Jake Wells on 11/27/16.
//  Copyright © 2016 Allen, Ashwell, and Wells. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController {

    @IBOutlet weak var dateStack: UIStackView!
    @IBOutlet weak var BACStack: UIStackView!
    @IBOutlet weak var drinksStack: UIStackView!

    @IBOutlet weak var nameLabel: UILabel!
    
    var userName = ""
    var defaults: UserDefaults = UserDefaults.standard
    var history: [DateObject] = []
    var formatter = DateFormatter()
    
    var yPos: CGFloat = 0
    let spacing: CGFloat = 3
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userName)
        let archivedHistory = defaults.object(forKey: "\(userName)History") as? NSData
        history = (NSKeyedUnarchiver.unarchiveObject(with: archivedHistory as! Data) as? [DateObject])!
        
        print("1")
        
        nameLabel.text = userName
        
        dateStack.spacing = spacing
        BACStack.spacing = spacing
        drinksStack.spacing = spacing
        
        for dateObj in history {
            formatter.dateStyle = .short
            formatter.timeStyle = .short
            
            let dateString = formatter.string(from: dateObj.date as Date)
            displayDate(dateString)
            displayDrinks(dateObj.drinks)
            displayBAC(dateObj.BAC)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func displayDate(_ dateString: String){
        
        // how tall is each label
        let labelHeight = dateStack.frame.height / 10
        
        // create a label
        let label = UILabel(frame: CGRect(x: 0, y: yPos, width: dateStack.frame.width, height: labelHeight))
        
        // look-and-feel of the label
        label.backgroundColor = UIColor.lightGray
        label.text = dateString
        label.textColor = UIColor.red
        
        // add the label to the stack view
        dateStack.addArrangedSubview(label)
        
        yPos += labelHeight + spacing
    }
    
    func displayDrinks(_ drinks: Int){
        // how tall is each label
        let labelHeight = dateStack.frame.height
        
        
        // create a label
        let label = UILabel(frame: CGRect(x: 0, y: yPos, width: dateStack.frame.width, height: labelHeight))
        
        // look-and-feel of the label
        label.backgroundColor = UIColor.lightGray
        label.text = "\(drinks)"
        label.textColor = UIColor.red
        
        // add the label to the stack view
        drinksStack.addArrangedSubview(label)
        
    }
    
    func displayBAC(_ BAC: Double){
        // how tall is each label
        let labelHeight = dateStack.frame.height
        
        // create a label
        let label = UILabel(frame: CGRect(x: 0, y: yPos, width: dateStack.frame.width, height: labelHeight))
        
        // look-and-feel of the label
        label.backgroundColor = UIColor.lightGray
        label.text = "\(BAC)"
        label.textColor = UIColor.red
        
        // add the label to the stack view
        BACStack.addArrangedSubview(label)
    }
}
