//
//  CustomTabBarController.swift
//  TixAura
//
//  Created by Alex Tran on 7/5/25.
//

import UIKit


class CustomTabBarController: UITabBarController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
       setBgBlurEffect()
        // Ép UIKit update layout ngay lập tức
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
    
  
    
    
}
