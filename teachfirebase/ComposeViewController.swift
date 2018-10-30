//
//  ComposeViewController.swift
//  teachfirebase
//
//  Created by Jan  on 21/10/2018.
//  Copyright © 2018 Jan . All rights reserved.
//

import UIKit
import Firebase

class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // ref = Database.database().reference()
        
    }
    
    @IBAction func addPost(_ sender: Any) {
      
        let postRef = Database.database().reference().child("posts").childByAutoId()
        
        let postObject = [
            "author": [
                "uid": "12345",
                "username": "Jan",
                "photoURL": "google.no"
            ],
            "text": textView.text,
            "timestamp": [".sv": "timestamp"]
        ] as [String: Any]
        
        if textView.hasText == true {
            postRef.setValue(postObject, withCompletionBlock: { error, ref in
                if error == nil {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    // Handle the error
                
                }
            })
        } else {
           self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        
        // Dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
