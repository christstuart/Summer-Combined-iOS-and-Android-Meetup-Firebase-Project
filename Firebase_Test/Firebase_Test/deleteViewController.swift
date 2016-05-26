//
//  deleteViewController.swift
//  Firebase_Test
//
//  Created by Chris T Stuart on 5/25/16.
//  Copyright © 2016 Chris T Stuart. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class deleteViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteTheUser(sender: UIButton) {
        
        let user = FIRAuth.auth()?.currentUser
        
        user?.deleteWithCompletion { error in
            if let error = error {
                // An error happened.
                print(error)
            } else {
                // Account deleted.
                let alet = UIAlertController(title: "User", message: "Deleted", preferredStyle: .Alert)
                
                alet.addAction(UIAlertAction(title: "ok", style: UIAlertActionStyle.Default, handler: nil))
                
                self.presentViewController(alet, animated: true, completion: nil)
                
                print("Deleted")
            }
        }
        
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
