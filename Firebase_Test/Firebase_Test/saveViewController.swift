//
//  saveViewController.swift
//  Firebase_Test
//
//  Created by Chris T Stuart on 5/25/16.
//  Copyright © 2016 Chris T Stuart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class saveViewController: UIViewController {
    
    @IBOutlet var nameText: UITextField!
    @IBOutlet var photoUrl: UITextField!
    @IBOutlet var updateEmail: UITextField!
    @IBOutlet var updatePassword: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        // Do any additional setup after loading the view.
    }

    @IBAction func update(sender: UIButton) {
        
        let user = FIRAuth.auth()?.currentUser
        if let user = user {
            let changeRequest = user.profileChangeRequest()
            
            changeRequest.displayName = nameText.text!
            changeRequest.photoURL =
                NSURL(string: photoUrl.text!)
           
            changeRequest.commitChangesWithCompletion { error in
                if let error = error {
                    // An error happened.
                    print(error)
                } else {
                    // Profile updated.
                    let alet = UIAlertController(title: user.displayName, message: String(user.photoURL), preferredStyle: .Alert)
                    
                    alet.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
                    
                    alet.addAction(UIAlertAction(title: "Open Image", style: UIAlertActionStyle.Cancel, handler: { (action) in
                        UIApplication.sharedApplication().openURL((user.photoURL!))
                    }))
                    
                    self.presentViewController(alet, animated: true, completion: nil)
                }
            }
        }

        
    }
    
    
    @IBAction func updateEmailAction(sender: UIButton) {
        
        let user = FIRAuth.auth()?.currentUser
        
        user?.updateEmail(updateEmail.text!) { error in
            if let error = error {
                // An error happened.
                print(error)
            } else {
                // Email updated.
                let alet = UIAlertController(title: user?.email, message: "worked", preferredStyle: .Alert)
                
                alet.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
                
              
                
                self.presentViewController(alet, animated: true, completion: nil)
            }
        }
        
    }
    @IBAction func updatePassword(sender: UIButton) {
        
        let user = FIRAuth.auth()?.currentUser
        let newPassword = updatePassword.text!
        
        user?.updatePassword(newPassword) { error in
            if let error = error {
                // An error happened.
                print(error)
            } else {
                // Password updated.
                let alet = UIAlertController(title: "Password Updated", message: "worked", preferredStyle: .Alert)
                
                alet.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
                
                
                
                self.presentViewController(alet, animated: true, completion: nil)
            }
        }
        
    }
   
    @IBAction func nextPage(sender: UIButton) {
        
        self.performSegueWithIdentifier("delete", sender: sender)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
}
