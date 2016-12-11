//
//  SelectUserViewController.swift
//  Safe Drinks
//
//  Created by Jake Wells on 12/10/16.
//  Copyright © 2016 Allen, Ashwell, and Wells. All rights reserved.
//

import UIKit

class SelectUserViewController: UIViewController {

    var defaults: UserDefaults = UserDefaults.standard
    var userNames: [String] = []

    var yPos: CGFloat = 0
    let spacing: CGFloat = 2

    @IBOutlet weak var nameStackView: UIStackView!
    @IBOutlet weak var selectedUser: UILabel!
    
    var counter = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNames = defaults.object(forKey: "userNames") as! [String]
        displayUsers()
        nameStackView.spacing = spacing
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayUsers(){
        for name in userNames{
            let decoded = defaults.object(forKey: "\(name)") as! Data
            let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
            addUserButton(decodedUser)
        }
                }
    func deleteButtons(){
        for button in nameStackView.subviews{
            button.removeFromSuperview()
        }
    }
    func addUserButton(_ user: User){
        
        // how tall is each label
        let buttonHeight = nameStackView.frame.height / 5
        if counter <= 4 {
        // create a label
        let button = UIButton(frame: CGRect(x: 0, y: yPos, width: nameStackView.frame.width, height: buttonHeight))

        // look-and-feel of the label
        button.backgroundColor = UIColor.lightGray
        button.setTitle(user.getName(), for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        // add the label to the stack view
        nameStackView.addArrangedSubview(button)

        yPos += buttonHeight + spacing
        }
    }
    
    func buttonAction(sender: UIButton!){
        selectedUser.text = sender.titleLabel!.text!
    }
    
    @IBAction func selectUser(_ sender: Any) {
        }
    
    @IBAction func removeUser(_ sender: Any) {
        
        for name in userNames{
            let index = userNames.index(of: name)
            let decoded = defaults.object(forKey: "\(name)") as! Data
            let decodedUser = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! User
            if decodedUser.getName() == selectedUser.text{
                defaults.removeObject(forKey: "\(name)")
                print(index!)
                print(userNames[index!])
                userNames.remove(at: index!)
                defaults.set(userNames, forKey: "userNames")
                deleteButtons()
                if userNames.count > 0{
                    displayUsers()
                }
                selectedUser.text = "Select a User"
            }

        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "userSelectedSegue"{
            let destination = segue.destination as! ViewController
            destination.userName = selectedUser.text!
        }
    }
}
