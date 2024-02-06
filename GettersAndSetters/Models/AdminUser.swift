//
//  AdminUser.swift
//  GettersAndSetters
//
//  Created by R K on 2/5/24.
//

import Foundation

struct AdminUser: User {
    let id = UUID().uuidString
    let fname: String
    let lname: String
    let email: String
    var nickName: String
    
    init(fname: String, lname: String, email: String, nickName: String = "") {
        self.fname = fname
        self.lname = lname
        self.email = email
        self.nickName = nickName.isEmpty ? "Boss" : nickName
    }
    
    func doAdminTask() {
        print("Doing admin task.")
    }
}
