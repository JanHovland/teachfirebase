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
    }
    
    @IBAction func addPost(_ sender: Any) {
      
        let postRef = Database.database().reference().child("posts").childByAutoId()
        
        if textView.text.count == 0 {
            self.dismiss(animated: true, completion: nil)
        } else {
                    
            let postObject = [
            "author": [
            "uid": "12345",                     // Hard koding
            "username": "Jan",                  // Hard koding
            "photoURL": "google.no"             // Hard koding
            ],
            "text": textView.text,              // kommer fra input, må endres til et textfelt
            "timestamp": [".sv": "timestamp"]
            ] as [String: Any]
        
            postRef.setValue(postObject, withCompletionBlock: { error, ref in
                if error == nil {
                    self.dismiss(animated: true, completion: nil)
                } else {
                  print(error as! String)
                }
            })
        }
    }
    
    @IBAction func cancelPost(_ sender: Any) {
        
        // Dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
        
        
    }
    
}
