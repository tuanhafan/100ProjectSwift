//  Welcome.swift
//  MovieFree
//
//  Created by Alex Tran on 23/4/25.
//

import UIKit
import FirebaseAuth

class RegisterView : UIViewController {
    
    
    @IBOutlet weak var viewContent: UIView!
    
    @IBOutlet weak var contentStv: UIStackView!
    
    @IBOutlet weak var rgUsernameView: UIView!
    @IBOutlet weak var rgUsernameTf : UITextField!
    
    @IBOutlet weak var rgPasswordView : UIView!
    @IBOutlet weak var rgPasswordTf : UITextField!
    @IBOutlet weak var btnShowPw: UIButton!
    
    @IBOutlet weak var rgConfirmPasswordView : UIView!
    @IBOutlet weak var rgConfirmPasswordTf : UITextField!
    
    @IBOutlet weak var btnRegister: UIButton!
    
    @IBOutlet weak var errorNotificationlb: UILabel!
    
    
    private var viewToTextFieldMap : [UIView:(textField:UITextField,label:UILabel)] = [:]
    var viewAnimationHandler : ViewAuthAnimateHandler?
    let authAservice = AuthService()
    let loginView = LoginView()
    var loadingView : LoadingView?
    
    private var toggoleShowPass : Bool = true {
        didSet {
            rgPasswordTf.isSecureTextEntry = toggoleShowPass
            rgConfirmPasswordTf.isSecureTextEntry = toggoleShowPass
            btnShowPw.setTitle(toggoleShowPass ? "Hiển Thị" : "Ẩn", for: .normal)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigation()
        setup()
        setupContentView()
        
    }
    
    
    var usernamePlaceholder : UILabel = {
        let lb = UILabel()
        lb.text = "Email"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = .lightText
        return lb
    }()
    
    var passwordPlaceholder : UILabel = {
        let lb = UILabel()
        lb.text = "Mật khẩu"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = .lightText
        return lb
    }()
    
    var confirmPasswordPlaceholder : UILabel = {
        let lb = UILabel()
        lb.text = "Nhập lại mật khẩu"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = .lightText
        return lb
    }()
    
    
    
    
    func setupNavigation() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Trợ giúp", style: .plain, target: self, action: #selector(supportPresed))
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "logoInApp")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        navigationItem.titleView = imageView
    }
    
    func setup() {
        
        rgPasswordTf.isSecureTextEntry = true
        rgConfirmPasswordTf.isSecureTextEntry = true
        UIView.performWithoutAnimation{
            btnShowPw.isHighlighted = false
        }
        
        viewToTextFieldMap[rgUsernameView] = (rgUsernameTf, usernamePlaceholder)
        viewToTextFieldMap[rgPasswordView] = (rgPasswordTf, passwordPlaceholder)
        viewToTextFieldMap[rgConfirmPasswordView] = (rgConfirmPasswordTf, confirmPasswordPlaceholder)
        
        viewAnimationHandler = ViewAuthAnimateHandler(viewToTextFieldMap: viewToTextFieldMap)
        viewAnimationHandler?.setupGestureRecognizers()
    }
    
    func setupContentView() {
        rgUsernameTf.isHidden = true
        rgPasswordTf.isHidden = true
        rgConfirmPasswordTf.isHidden = true
        
        rgUsernameView.addSubview(usernamePlaceholder)
        rgPasswordView.addSubview(passwordPlaceholder)
        rgConfirmPasswordView.addSubview(confirmPasswordPlaceholder)
        
        usernamePlaceholder.translatesAutoresizingMaskIntoConstraints = false
        passwordPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordPlaceholder.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernamePlaceholder.centerYAnchor.constraint(equalTo: rgUsernameView.centerYAnchor),
            usernamePlaceholder.leadingAnchor.constraint(equalTo: rgUsernameView.leadingAnchor,constant: 10),
            
            passwordPlaceholder.centerYAnchor.constraint(equalTo: rgPasswordView.centerYAnchor),
            passwordPlaceholder.leadingAnchor.constraint(equalTo: rgPasswordView.leadingAnchor,constant: 10),
            
            confirmPasswordPlaceholder.centerYAnchor.constraint(equalTo: rgConfirmPasswordView.centerYAnchor),
            confirmPasswordPlaceholder.leadingAnchor.constraint(equalTo: rgConfirmPasswordView.leadingAnchor,constant: 10),
            
        ])
    }
    
    @objc func supportPresed() {
        
    }
    
    @IBAction func showPwPressed(_ sender: UIButton) {
        toggoleShowPass = !toggoleShowPass
    }
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        view.endEditing(true)
        if let email = rgUsernameTf.text, !email.isEmpty, let password = rgPasswordTf.text, !password.isEmpty {
            loadingView = LoadingView.show(in: self.view)
            authAservice.createUser(username: email, password: password){ result in
                switch result {
                case .success(let userID):
                    print(userID)
                case .failure(let error as NSError):
                    switch error.code {
                    case AuthErrorCode.emailAlreadyInUse.rawValue:
                        self.errorNotificationlb.text =  "Email đã được sử dụng."
                    case AuthErrorCode.invalidEmail.rawValue:
                        self.errorNotificationlb.text = "Email không hợp lệ."
                    case AuthErrorCode.weakPassword.rawValue:
                        self.errorNotificationlb.text = "Vui lòng nhập mật từ 6 kí tự hơặc lớn hơn"
                    default:
                        print("Lỗi: \(error.localizedDescription)")
                    }
                }
                self.loadingView?.hide()
                
            }
        }
    }
}
