//
//  BasicUser.swift
//  GettersAndSetters
//
//  Created by R K on 2/5/24.
//

import Foundation

struct BasicUser {
    let id = UUID().uuidString
    let fname: String
    let lname: String
    let email: String
    var nickName: String? = nil
}
