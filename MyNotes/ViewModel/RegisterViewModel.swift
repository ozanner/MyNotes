//
//  RegisterViewModel.swift
//  MyNotes
//
//  Created by ozan on 17.08.2023.
//

import UIKit

//RegisterViewModel -> email, password, name, username e göre aktif veya pasifliği belirtiyoruz
struct RegisterViewModel {
    
    var emailText: String?
    var passwordText: String?
    var nameText: String?
    var usernameText: String?
    var status: Bool{
        return emailText?.isEmpty == false && passwordText?.isEmpty == false && nameText?.isEmpty == false && usernameText?.isEmpty == false
    }
    
}

