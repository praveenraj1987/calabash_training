//
//  ViewController.swift
//  TrainingCalabash
//
//  Created by Kuldeep Mishra on 14/03/16.
//  Copyright © 2016 Kuldeep Mishra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let validUsers = ["kuldeep" : "1234", "pallavi" : "1111", "praveen" : "0000"]
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var userName: UITextField!

//     MARK: segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showFirstViewController" {
           let nextViewController = segue.destinationViewController as! NextViewController
            nextViewController.userName = userName.text
        }
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        return login()
    }
    
    func login() -> Bool {
        if validUsers[userName.text!.lowercaseString] == password.text! {
            return true
        }
        showErrorAlert()
        return false
    }
    
    func showErrorAlert() {
       let actionSheetController = UIAlertController(title: "Sorry...", message: "username or password is incorrect. Please enter correct username and password", preferredStyle: .Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in }
        actionSheetController.addAction(cancelAction)

        //Present the AlertController
        self.presentViewController(actionSheetController, animated: true, completion: nil)
    }
    
// MARK: textField delegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == userName {
            password.becomeFirstResponder()
        } else if textField == password {
            login()
        }
        return true
    }
    
}

