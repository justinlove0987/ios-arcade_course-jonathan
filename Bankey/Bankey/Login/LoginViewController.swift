//
//  ViewController.swift
//  Bankey
//
//  Created by justin on 2022/4/19.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private let loginView = LoginView()
    
    private let SignInButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }


}

extension LoginViewController {
    private func style() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        SignInButton.translatesAutoresizingMaskIntoConstraints = false
        SignInButton.configuration = .filled()
        SignInButton.configuration?.imagePadding = 8
        SignInButton.setTitle("Sign In", for: [])
        SignInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
    }
    
    private func layout() {
        view.addSubview(loginView)
        view.addSubview(SignInButton)
        
        // LoginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
        ])
        
        // Button
        NSLayoutConstraint.activate([
            SignInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            SignInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            SignInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
        ])
    }
    
}

// MARK: - Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        
    }
}
