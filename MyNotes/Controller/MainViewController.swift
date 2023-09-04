//
//  MainViewController.swift
//  MyNotes
//
//  Created by ozan on 4.09.2023.
//

import UIKit
import FirebaseAuth


class MainViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        //signOut()
        userStatus()
    }
    
    private func userStatus() {
        if Auth.auth().currentUser?.uid == nil {
            //print("Kullanıcı yok")
            let controller = UINavigationController(rootViewController: LoginViewController())
            controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true)
            
        }else {
            print("Kullanıcı var")
        }
    }
    
    private func signOut() {
        do {
            try Auth.auth().signOut()
            userStatus()
        }catch{
            
        }
    }
}
