//
//  MainViewController.swift
//  MyNotes
//
//  Created by ozan on 4.09.2023.
//

import UIKit
import FirebaseAuth


class MainTabBarViewController: UITabBarController {
    
    // MARK: - Properties
    let pastTaskViewController = PastTaskViewController()
    let tasksViewController = TasksViewController()
    let profileViewController = ProfileViewController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        //signOut()
        userStatus()
        style()
    }
    
  
}


// MARK: - Helpers
extension MainTabBarViewController{
    private func style() {
        viewControllers = [
            configureViewController(rootViewController: pastTaskViewController, title: "Past", image: "arrow.counterclockwise.circle"),
            configureViewController(rootViewController: tasksViewController, title: "Tasks", image: "checkmark.circle"),
            configureViewController(rootViewController: profileViewController, title: "Profile", image: "person.crop.circle")
        ]
        configureTabBar()
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
    
    private func configureViewController(rootViewController: UIViewController, title: String, image: String)-> UINavigationController {
        
        let controller = UINavigationController(rootViewController: rootViewController)
        controller.tabBarItem.title = title
        controller.tabBarItem.image = UIImage(systemName: image)
        
        return controller
    }
    
    private func configureTabBar() {
        let shape = CAShapeLayer()
        let bezier = UIBezierPath(roundedRect: CGRect(x: 10, y: (self.tabBar.bounds.minY) - 14, width: (self.tabBar.bounds.width) - 20, height: (self.tabBar.bounds.height) + 28), cornerRadius: ((self.tabBar.bounds.height) + 28) / 5)
        shape.path = bezier.cgPath
        shape.fillColor = UIColor.white.cgColor
        self.tabBar.itemPositioning = .fill
        self.tabBar.itemWidth = ((self.tabBar.bounds.width) - 20) / 5
        self.tabBar.tintColor = UIColor.systemBlue.withAlphaComponent(0.8) // seçilen tab item ın rengi
        self.tabBar.unselectedItemTintColor = UIColor.lightGray// seçilmeyenlerin rengi
        self.tabBar.layer.insertSublayer(shape, at: 0)
        selectedIndex = 1 // bu yapıldığında ortadaki sayfa açılıcak ilk olarak.
    }
    
}

