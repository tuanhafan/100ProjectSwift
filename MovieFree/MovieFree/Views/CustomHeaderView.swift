//
//  CustomHeaderView.swift
//  TixAura
//
//  Created by Alex Tran on 9/5/25.
//

import UIKit

class CustomHeaderView: UIView {
    
    private var typeHeader:Int?
    private let blurView = UIVisualEffectView(effect: nil)
    private var dimmingView = UIView()
    
    
    
    private let btnCatgory : UIButton = {
        let btn = UIButton(type: .system)
        
        
        var config = UIButton.Configuration.plain()
        config.title = "Thể loại"
        let symbolConfig = UIImage.SymbolConfiguration(pointSize: 8, weight: .regular)
        config.image = UIImage(systemName: "chevron.down", withConfiguration: symbolConfig)
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 12, bottom: 4, trailing: 12)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .systemFont(ofSize: 12)
            return outgoing
        }
        
        btn.configuration = config
        btn.tintColor = .white
        btn.layer.cornerRadius = 10
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.gray.cgColor
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    
    private let btnCast : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "cast"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let btnDownload : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "download"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    private let btnSearch : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "search"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    
    func setup(){
        self.addSubview(btnCatgory)
        self.addSubview(btnCast)
        self.addSubview(btnDownload)
        self.addSubview(btnSearch)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupBlurEffect()
        
    }
    
    func layoutActive(wtth superview: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.heightAnchor.constraint(equalToConstant: 90),
            
            
            // Constraints for btnCatgory
            btnCatgory.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            btnCatgory.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            // Constraints for btnSearch
            btnSearch.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            btnSearch.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            btnSearch.widthAnchor.constraint(equalToConstant: 20),
            btnSearch.heightAnchor.constraint(equalToConstant: 20),
            
            // Constraints for btnDownload
            btnDownload.trailingAnchor.constraint(equalTo: btnSearch.leadingAnchor, constant: -16),
            btnDownload.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            btnDownload.widthAnchor.constraint(equalToConstant: 20),
            btnDownload.heightAnchor.constraint(equalToConstant: 20),
            
            // Constraints for btnCast
            btnCast.trailingAnchor.constraint(equalTo: btnDownload.leadingAnchor, constant: -16),
            btnCast.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            btnCast.widthAnchor.constraint(equalToConstant: 20),
            btnCast.heightAnchor.constraint(equalToConstant: 20),
            
        ])
        self.layoutIfNeeded()
    }
    
    func setupBlurEffect() {
        blurView.frame = self.bounds
        blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurView.effect = nil
        blurView.alpha = 0
        
        dimmingView.frame = self.bounds
        dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        dimmingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        dimmingView.alpha = 0
        
        self.insertSubview(blurView, at: 0)
        blurView.contentView.addSubview(dimmingView)
    }
    
    func setBlurVisible(_ visible: Bool, animated: Bool = true) {
        let effect = visible ? UIBlurEffect(style: .systemUltraThinMaterialDark) : nil
        if animated {
            UIView.animate(withDuration: 0.1) {
                self.blurView.effect = effect
                self.blurView.alpha = visible ? 1.0 : 0.0
                self.dimmingView.alpha = visible ? 1.0 : 0.0
            }
        } else {
            blurView.effect = effect
            dimmingView.alpha = visible ? 1.0 : 0.0
        }
    }
    
    
}
