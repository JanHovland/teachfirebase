//
//  ViewController.swift
//  teachfirebase
//
//  Created by Jan  on 21/10/2018.
//  Copyright © 2018 Jan . All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var ref: DatabaseReference?
    var databaseHandle: DatabaseHandle?
    
    var postData = [String]()
    var posts = [Post]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.delegate = self
        tableView.dataSource = self
        
//        // Set the Firebase reference
//        ref = Database.database().reference()
//
//        // Retrieve the posts and listen for changes
//        databaseHandle = ref?.child("Posts").observe(.childAdded, with: { (snapshot) in
//
//            // Try to convert the value of the data into a string
//            let post = snapshot.value as? String
//            if let actualPost = post {
//
//                // Append the data to our postDataarray
//                self.postData.append(
//                    actualPost)
//
//                // Reload he tableview
//
//                self.tableView.reloadData()
//
//            }
//
//        })
//
//        // Fjerner Database handle
//
//        ref?.removeObserver(withHandle: databaseHandle!)
        
        observePosts()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
    }
    
    func observePosts() {
        let postsRef = Database.database().reference().child("posts")
        
        postsRef.observe(.value, with: { snapshot in
            
            var tempPosts = [Post]()
            
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                    let dict = childSnapshot.value as? [String:Any],
                    let author = dict["author"] as? [String:Any],
                    let uid = author["uid"] as? String,
                    let username = author["username"] as? String,
                    let photoURL = author["photoURL"] as? String,
                    let url = URL(string:photoURL),
                    let text = dict["text"] as? String,
                    let timestamp = dict["timestamp"] as? Double {
                    
                    let userProfile = UserProfile(uid: uid, username: username, photoURL: url)
                    let post = Post(id: childSnapshot.key, author: userProfile, text: text, timestamp:timestamp)
                    tempPosts.append(post)
                    self.postData.append(text)
                    
                }
                
            }
            
            self.posts = tempPosts
            self.tableView.reloadData()
            
        })
    }
    
}

