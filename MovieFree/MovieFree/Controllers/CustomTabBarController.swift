//
//  CustomTabBarController.swift
//  TixAura
//
//  Created by Alex Tran on 7/5/25.
//

import UIKit
protocol CoordinatorInEjectable {
    var mainCoordinator: MainCoordinator? {get set}
}

class CustomTabBarController: UITabBarController {
    var mainCoordinator : MainCoordinator?
    var imageView: UIImageView!
    let zoomAnimator = ZoomAnimator()
    override func viewDidLoad() {
        super.viewDidLoad()
        setBgBlurEffect()
        coordinatorToSubVC()
      
        if let navigationController = self.navigationController {
            navigationController.delegate = zoomAnimator
        } else {
            print("❌ TabBarController KHÔNG bị bọc bởi UINavigationController.")
        }
        navigationController?.setNavigationBarHidden(true, animated: false)
        
    }
    
    
    private func setBgBlurEffect(){
        let appearance = UITabBarAppearance()
            appearance.configureWithTransparentBackground()
            
            // Nền mờ màu tối
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
            appearance.backgroundColor = UIColor.black.withAlphaComponent(0.25) // độ mờ
        
            tabBarController?.tabBar.isTranslucent = false
            self.tabBar.standardAppearance = appearance
            if #available(iOS 15.0, *) {
                tabBar.scrollEdgeAppearance = appearance
            }
    }
    
    
    private func coordinatorToSubVC(){
        for viewController in viewControllers ?? [] {
            if let navVC = viewController as? UINavigationController {
                if let rootVc = navVC.viewControllers.first {
                    injectCoordinator(to: rootVc)
                }
            } else {
                injectCoordinator(to: viewController)
            }
        }
    }
    
    private func injectCoordinator(to viewContoller: UIViewController){
        if var coordinatorAssignable = viewContoller as? CoordinatorInEjectable {
            coordinatorAssignable.mainCoordinator = self.mainCoordinator
        }
        
    }
    
    
}

extension CustomTabBarController : ZoomingViewController {
    func zoomingBackgroundView(for transition: ZoomAnimator) -> UIView? {
        nil
    }
    
    func zoomingImageView(for trasiton: ZoomAnimator) -> UIImageView? {
        return imageView
    }
    
    
}
