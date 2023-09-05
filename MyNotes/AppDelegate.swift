//
//  AppDelegate.swift
//  MyNotes
//
//  Created by ozan on 15.08.2023.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        window = UIWindow()
        window?.rootViewController =  MainTabBarViewController()
        window?.makeKeyAndVisible()
        
        return true
    }

   


}

