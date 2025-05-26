//
//  LoginViewModel.swift
//  TixAura
//
//  Created by Alex Tran on 24/4/25.
//

import UIKit
//import FirebaseAuth

class AuthViewModel: UIViewController {
    
    
    @IBOutlet weak var logoView: LogoAnimationView!
    
    @IBOutlet weak var loginView: LoginView!
    
    
//    var mainCoordinator : MainCoordinator?
    var loading = LoadingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLeftButtonBar()
        
        
        
        logoView.layoutActicve(with: self.view)
        loginView.layoutActive(with: self.view)
        
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0 ) {
            self.performSegue(withIdentifier: "wellcomGotoTabbar", sender: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    
    func setupLeftButtonBar() {
        let button = UIButton(type: .system)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
    }
    
    func getXYBtnBar() -> (x:CGFloat,y:CGFloat) {
        guard let  barButtonView =  navigationItem.leftBarButtonItem?.customView,
              let superview = barButtonView.superview else {return (0,0)}
        
        // Convert vị trí bar button sang toạ độ của self.view
        let targetFrameInView = superview.convert(barButtonView.frame, to: self.view)
        
        // Tính vị trí mới
        let targetX = targetFrameInView.origin.x
        let targetY = targetFrameInView.origin.y
        
        return (targetX,targetY)
    }
    
//    func checkUserLoginStatus(){
//        if Auth.auth().currentUser != nil {
////            loading = LoadingView.show(in: self.view,alpha: 1.0)
//            mainCoordinator?.goTabarController()
//        }
//        else {
//            self.logoView.animation(wtth: self.view, x: self.getXYBtnBar().x, y: self.getXYBtnBar().y) {
//                self.loginView.animation(with: self.view)
//            }        }
//    }
    
    @IBAction func goRegister(_ sender: UIButton) {
//        loginView.handler?.removeLayout(view: nil)
    }
}
