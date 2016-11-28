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
    
    @IBOutlet weak var DropDownTable: UITableView!
    
    @IBAction func selectUserButton(_ sender: UIButton) {
        displayUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
            tester()
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayUsers(){
        for user in users.getUsers(){
            let userTableCell = UITableViewCell()
            userTableCell.textLabel?.text = user.getName()
            DropDownTable.addSubview(userTableCell)
        }
        DropDownTable.isHidden = false
    }
    
    func tester(){
        let test = User("Jake")
        users.addUser(test)
    }
    
    
    //let indexpath = DropDownTable.indexPathForSelectedRow
    //let currentCell = DropDownTable.cellForRow(at: indexpath!)! as UITableViewCell
    //currentCell.backgroundColor = UIColor.blue
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let indexPath = DropDownTable.indexPathForSelectedRow //optional, to get from any UIButton for example
        
        let currentCell = DropDownTable.cellForRow(at: indexPath!)! as UITableViewCell
        
        currentCell.backgroundColor = UIColor.blue
    }
    
    
}

