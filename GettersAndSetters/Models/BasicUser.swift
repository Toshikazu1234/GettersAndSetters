//
//  BasicUser.swift
//  GettersAndSetters
//
//  Created by R K on 2/5/24.
//

import Foundation

struct BasicUser: User {
    let id = UUID().uuidString
    let fname: String
    let lname: String
    let email: String
    let dob: String
    var nickName: String
    var age: Int {
        // Compute the age based on dob
        return 0
    }
    
    init(fname: String, lname: String, email: String, dob: String, nickName: String = "") {
        self.fname = fname
        self.lname = lname
        self.email = email
        self.dob = dob
        self.nickName = nickName.isEmpty ? fname : nickName
    }
}
