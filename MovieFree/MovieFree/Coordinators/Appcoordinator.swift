//
//  Appcoordinator.swift
//  MovieFree
//
//  Created by Alex Tran on 23/4/25.
//

import UIKit
class Appcoordinator {
    
    let navigationController : UINavigationController
    let window: UIWindow
    
    init(window: UIWindow) {
        self.navigationController = UINavigationController()
        self.window = window
    }
    
    func start() {
        let mainCoordinator = MainCoordinator(navigationController: navigationController)
        
        mainCoordinator.start()
        
        window.rootViewController = navigationController // set naviagtioncontroller as rootViewController
        window.makeKeyAndVisible()
    }
}
