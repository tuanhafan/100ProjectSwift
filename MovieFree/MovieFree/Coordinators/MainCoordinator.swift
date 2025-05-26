//
//  MainCoordinator.swift
//  MovieFree
//
//  Created by Alex Tran on 23/4/25.
//
import UIKit
class MainCoordinator {
    let navigationController : UINavigationController
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
    
        if let welcomLogin = storyboard.instantiateViewController(withIdentifier: "Welcom_LoginViewController" ) as? Welcom_LoginViewController {
            welcomLogin.mainCoordinator = self
            navigationController.pushViewController(welcomLogin, animated: false)
        }
    }
    
    func goTabarController() {
            if let tabBarVC = storyboard.instantiateViewController(withIdentifier: "CustomTabBarController") as? CustomTabBarController {
                tabBarVC.mainCoordinator = self
                navigationController.setViewControllers([tabBarVC], animated: true)
            }
        }
}

