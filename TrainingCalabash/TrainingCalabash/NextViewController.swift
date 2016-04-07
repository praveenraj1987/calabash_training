//
//  NextViewController.swift
//  TrainingCalabash
//
//  Created by Kuldeep Mishra on 15/03/16.
//  Copyright © 2016 Kuldeep Mishra. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    var userName: String?
    
    @IBOutlet weak var welcomeTextLabel: UILabel!
    override func viewDidLoad() {
        welcomeTextLabel.text = "Welcome, \(userName!.capitalizedString)"
    }
    
}