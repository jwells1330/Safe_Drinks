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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
