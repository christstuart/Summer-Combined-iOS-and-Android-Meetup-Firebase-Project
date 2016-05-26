//
//  ViewController.swift
//  Firebase_Test
//
//  Created by Chris T Stuart on 5/25/16.
//  Copyright © 2016 Chris T Stuart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ViewController: UIViewController {
    
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var emailText: UITextField!
    
    var ref: FIRDatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Getting the reference of the database
        
        ref = FIRDatabase.database().reference()
        
        /*
         
         // On line 32 we are saving data, on line 34 we are reading that data.
        
        self.ref!.child("users").child("login").setValue(["username": "Chris T Stuart"])
        
        ref?.observeSingleEventOfType(.ChildAdded, withBlock: { (snapchot) in
            print(snapchot)
        })
 
        */
   
    }
    
    
    @IBAction func login(sender: UIButton) {

        FIRAuth.auth()?.createUserWithEmail(emailText.text!, password: passwordText.text!, completion: { (user, error) in
            
            if let error = error {
                // An error happened.
                print(error)
                
            } else {
                // Profile updated.
                self.performSegueWithIdentifier("detail", sender: sender)
            }
            
        })
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

