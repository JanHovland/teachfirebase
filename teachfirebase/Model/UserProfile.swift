//
//  UserProfile.swift
//  teachfirebase
//
//  Created by Jan  on 30/10/2018.
//  Copyright © 2018 Jan . All rights reserved.
//

import Foundation

class UserProfile {
    var uid:String
    var username:String
    var photoURL:URL
    
    init(uid:String, username:String,photoURL:URL) {
        self.uid = uid
        self.username = username
        self.photoURL = photoURL
    }
}
