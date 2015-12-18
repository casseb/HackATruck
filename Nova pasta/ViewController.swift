//
//  ViewController.swift
//
//  Created by Student on 12/14/15.
//  Copyright © 2015 Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var listUsers = [User]()
    
    @IBOutlet weak var labelUsername: UITextField!
    @IBOutlet weak var labelPassword: UITextField!
    
    @IBAction func loginAct(sender: AnyObject) {
        for index in 0..<self.listUsers.count {
            let u = listUsers[index]
            
            if listUsers.count > 0 {
                if u.login == labelUsername.text && u.password == labelPassword.text {
                    self.performSegueWithIdentifier("segueHome", sender: self)
                } else {
                    let alertController = UIAlertController(title: "Failed", message: "Username or Password are wrong!", preferredStyle: UIAlertControllerStyle.Alert);
                    
                    alertController.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default,handler: nil));
                    
                    self.presentViewController(alertController, animated: true, completion: nil);
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserLog.getReference().setUser(User(login: "admin", password: "123", name: "Helio"))
        self.listUsers.append(UserLog.getReference().getUser())
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

