//
//  LoginViewModel.swift
//  MyNotes
//
//  Created by ozan on 16.08.2023.
//

import UIKit

// LoginViewModel -> email ve password e yazılana göre butonumuzun aktif veya pasif olduğunu belirtmek için yapıyoruz

struct LoginViewModel {
    //Modeldeki datalar oluşturuluyor
    var emailText: String?
    var passwordText: String?
    var status: Bool{
        return emailText?.isEmpty == false && passwordText?.isEmpty == false
    }
    
}
