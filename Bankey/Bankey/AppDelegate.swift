//
//  AppDelegate.swift
//  Bankey
//
//  Created by justin on 2022/4/19.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboradingContainerViewController = OnboardingContainerViewController()
    var dummyViewController = DummyViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground

        loginViewController.delegate = self
        onboradingContainerViewController.delegate = self
        dummyViewController.logoutDelegate = self
        
        window?.rootViewController = dummyViewController
        
        return true
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
        
        
    }
}

// MARK: - LoginViewControllerDelegate

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        setRootViewController(onboradingContainerViewController)
    }
}

// MARK: - OnboardingContainerViewControllerDelegate

extension AppDelegate: OnboardingContainerViewControllerDelegate {
    func didFinishingOnboarding() {
        setRootViewController(dummyViewController)
    }
}

// MARK: - LogoutDelegte

extension AppDelegate: LogoutDelegte {
    func didLogout() {
        print("DEBUG: did log out")
        setRootViewController(loginViewController)
    }
}


