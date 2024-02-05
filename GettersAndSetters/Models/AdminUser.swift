//
//  AdminUser.swift
//  GettersAndSetters
//
//  Created by R K on 2/5/24.
//

import Foundation

struct AdminUser {
    let id = UUID().uuidString
    let fname: String
    let lname: String
    let email: String
    var nickName: String? = nil
    
    func doAdminTask() {
        print("Doing admin task.")
    }
}
