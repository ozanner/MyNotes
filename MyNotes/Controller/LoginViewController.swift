//
//  ViewController.swift
//  MyNotes
//
//  Created by ozan on 15.08.2023.
//

import UIKit

class LoginViewController: UIViewController {
    
  // MARK: - Properties
    
    private var viewModel = LoginViewModel() //view model eklendi
    
    private let logoImageView: UIImageView = { //logo
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit // image i tam doldurucak şekilde yerleştir
        imageView.clipsToBounds = true
        imageView.image = UIImage(systemName: "text.badge.checkmark") // logonun iconu eklenmesi
        imageView.tintColor = .white // logonun rengini değiştirme
        
        return imageView
    }()
    
    private lazy var emailContainerView: UIView = {
       let containerView = AuthenticationInputView(image: UIImage(systemName: "envelope")!, textField: emailTextField)
        return containerView
    }()
    
    private lazy var passwordContainerView: UIView = {
       let containerView = AuthenticationInputView(image: UIImage(systemName: "lock")!, textField: passwordTextField)
        return containerView
    }()
    
    private let emailTextField: UITextField = {
       let textField = CustomTextField(placeholder: "Email")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
       let textField = CustomTextField(placeholder: "Password")
        textField.isSecureTextEntry = true //şifreyi girerken gizlemesini sağlar
        return textField
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title3)
        button.layer.cornerRadius = 7 //ovalleşmesini sağlar butonun
        button.isEnabled = false // ilk başta butonu inaktif yapmasını sağlar
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true // equalToConstant : constant değerini ayarlarız
        return button
    }()
    
    private var stackView = UIStackView() //stackview oluşturduk
    
    private lazy var switchToRegistrationPage: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Click To Become A Member", attributes: [.foregroundColor: UIColor.white, .font: UIFont.boldSystemFont(ofSize: 14)])
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleGoRegister), for: .touchUpInside)

        return button
    }()
    
  // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

  

}

// MARK: - Selector

extension LoginViewController{
    
    @objc private func handleGoRegister(_ sender: UIButton){
        let controller = RegisterViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    } // tıklandığında register sayfasına gönderir
    
    @objc private func handleTextField(_ sender: UITextField) { // bu fonksiyon tıklandığında çalışan fonsiyon
        if sender == emailTextField {
            viewModel.emailText = sender.text
        }else{
            viewModel.passwordText = sender.text
        }
        loginButtonStatus()
    }
}

// MARK: - Helpers

extension LoginViewController{
    
    private func loginButtonStatus(){ // aktif mi inaktif mi olduğunu belirleyen fonksiyon
        if viewModel.status{
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            
        }else{
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        }
    }
    
    private func style(){ // ekranda stylelerin belirlenmesini yapar
        backgroundGradientColor() // sayfanın backgroundını oluşturur
        logoImageView.translatesAutoresizingMaskIntoConstraints = false // otomatik düzenlenmesini kapadık
        logoImageView.layer.cornerRadius = 150 / 2
        
        //stack view
        stackView = UIStackView(arrangedSubviews: [emailContainerView, passwordContainerView, loginButton])//stack view de olacaklar
        stackView.axis = .vertical // stack view yönü
        stackView.spacing = 14 // elemanlar arasında boşluk
        stackView.distribution = .fillEqually // bütün elemanların eşit boyutlarda olmasını sağlıyoruz
        stackView.translatesAutoresizingMaskIntoConstraints = false
        switchToRegistrationPage.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(handleTextField), for: .editingChanged)
    }
    
    private func layout(){ // elemanların ekrandaki yerleştirilmesi
        view.addSubview(logoImageView) //ekrana logoyu ekleme
        view.addSubview(stackView) // ekrana stackview ekleme
        view.addSubview(switchToRegistrationPage) // ekrana butonu ekleme
        NSLayoutConstraint.activate([// Anchor'ların belirlenmesi. Örn : en boy ayarlanması, ekranda nerede olacağı vs.
            logoImageView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 16),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 150),
            logoImageView.heightAnchor.constraint(equalToConstant: 150),
            
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 32),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 32),
            
            switchToRegistrationPage.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 8),
            switchToRegistrationPage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            view.trailingAnchor.constraint(equalTo: switchToRegistrationPage.trailingAnchor, constant: 32),
            
        ])
    }
}
