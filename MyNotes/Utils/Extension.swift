//
//  Extension.swift
//  MyNotes
//
//  Created by ozan on 15.08.2023.
//

import UIKit
import JGProgressHUD

extension UIViewController{
    func backgroundGradientColor(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemCyan.cgColor, UIColor.systemMint.cgColor]
        gradient.locations = [0,1]
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
    
    func showHud(show: Bool){
        view.endEditing(true)//ekranda bir şey açıksa kapatılsın
        let jgProgressHud = JGProgressHUD(style: .dark)
        jgProgressHud.textLabel.text = "Loading"
        jgProgressHud.detailTextLabel.text = "Please Wait"
        
        if show{
            jgProgressHud.show(in: view)
        }else {
            jgProgressHud.dismiss(animated: true)
        }
    }
}
