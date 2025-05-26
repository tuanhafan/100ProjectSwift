//  Welcome.swift
//  MovieFree
//
//  Created by Alex Tran on 23/4/25.
//

import UIKit

class LoginView : UIStackView {
    
    
    @IBOutlet weak var usernameView: UIView!
    
    @IBOutlet weak var usernameTf: UITextField!
    
    @IBOutlet weak var passwordView: UIView!
    
    @IBOutlet weak var passwordTf: UITextField!
    
    @IBOutlet weak var btnShowPassword: UIButton!
    
    @IBOutlet weak var loginPressed: UIButton!
    
    @IBOutlet weak var bottomStv: UIStackView!
    
    @IBOutlet weak var gotoSigupPressed: UIButton!
    
    @IBOutlet weak var forgotPressed: UIButton!
    
    var onButtonTapped: (() -> Void)?
    private var viewToTextFieldMap : [UIView : (textField : UITextField, label: UILabel)] = [:]
    var handler: ViewAuthAnimateHandler?
    
    private var toggoleShowPass : Bool = true {
        didSet {
            passwordTf.isSecureTextEntry = toggoleShowPass
            btnShowPassword.setTitle(toggoleShowPass ? "Hiển Thị" : "Ẩn", for: .normal)
        }
    }
    
    var usernamePlacholder : UILabel = {
        let lb = UILabel()
        lb.text = "Email"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = .lightText
        return lb
    }()
    
    var passwordPlacholder : UILabel = {
        let lb = UILabel()
        lb.text = "Mật khẩu"
        lb.font = UIFont.systemFont(ofSize: 14)
        lb.textColor = .lightText
        return lb
    }()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
       
        viewToTextFieldMap[usernameView] = (usernameTf,usernamePlacholder)
        viewToTextFieldMap[passwordView] = (passwordTf,passwordPlacholder)
       
        handler = ViewAuthAnimateHandler(viewToTextFieldMap: viewToTextFieldMap)
        handler?.setupGestureRecognizers()
    }
    
    
    // MARK: - Setup
    func setUp() {
    
        self.alpha = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        passwordTf.isSecureTextEntry = true
        UIView.performWithoutAnimation{
            btnShowPassword.isHighlighted = false
        }
        if let superview = self.superview {
            layoutActive(with: superview)
        }
        setupContentView()
    }
    
    func layoutActive(with superview: UIView) {
        NSLayoutConstraint.activate([
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: 200),
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.widthAnchor.constraint(equalToConstant: 250),
            self.heightAnchor.constraint(equalToConstant: 200)
        ])    }

    
    
    func setupContentView() {
        usernameTf.isHidden = true
        passwordTf.isHidden = true
        
        usernameView.addSubview(usernamePlacholder)
        passwordView.addSubview(passwordPlacholder)

        usernamePlacholder.translatesAutoresizingMaskIntoConstraints = false
        passwordPlacholder.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            usernamePlacholder.centerYAnchor.constraint(equalTo: usernameView.centerYAnchor),
            usernamePlacholder.leadingAnchor.constraint(equalTo: usernameView.leadingAnchor,constant: 10),
            
            passwordPlacholder.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            passwordPlacholder.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor,constant: 10)

        ])
    }
    
    func animation(with superview: UIView) {
        superview.constraints.forEach {
            if $0.firstItem as? UIStackView == self || $0.secondItem as? UIStackView == self {
                $0.isActive = false
            }
        }

        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.widthAnchor.constraint(equalToConstant: 250),
            self.heightAnchor.constraint(equalToConstant: 200),
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
        ])

        
        UIView.animate(withDuration: 0.9){
            self.alpha = 1
            superview.layoutIfNeeded()
        }
    }
    
    @IBAction func showPassPressed(_ sender: UIButton) {
        toggoleShowPass = !toggoleShowPass
    }
    
  
    
}
