//
//  RegisterViewModel.swift
//  MyNotes
//
//  Created by ozan on 17.08.2023.
//

import UIKit

// LoginViewModel -> email ve password e yazılana göre butonumuzun aktif veya pasif olduğunu belirtmek için yapıyoruz

struct RegisterViewModel {
    
    var emailText: String?
    var passwordText: String?
    var nameText: String?
    var usernameText: String?
    
    var status: Bool{
        return emailText?.isEmpty == false && passwordText?.isEmpty == false && nameText?.isEmpty == false && usernameText?.isEmpty == false
    }
    
}

