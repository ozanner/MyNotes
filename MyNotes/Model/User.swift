//
//  User.swift
//  MyNotes
//
//  Created by ozan on 18.09.2023.
//

import Foundation
//User Modeli
struct User {
    let email: String
    let name: String
    let profileImageUrl: String
    let uid: String
    let userName: String
    init(data: [String: Any]) {
        self.email = data["email"] as? String ?? ""
        self.name = data["name"] as? String ?? ""
        self.profileImageUrl = data["profileImageUrl"] as? String ?? ""
        self.uid = data["uid"] as? String ?? ""
        self.userName = data["userName"] as? String ?? ""
    }
}
