//
//  ComposeViewController.swift
//  teachfirebase
//
//  Created by Jan  on 21/10/2018.
//  Copyright © 2018 Jan . All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addPost(_ sender: Any) {
      
        // TODO: Post the data to Firebase
        
        // Dismiss the popover
        presentingViewController?.dismiss(animated: true, completion: nil)
        
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
