//
//  LogoAnimationView.swift
//  TixAura
//
//  Created by Alex Tran on 24/4/25.
//

import UIKit

class LogoAnimationView: UIImageView {
    
    private var didAnimateMask = false
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup	()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !didAnimateMask && self.bounds.width > 0 {
            didAnimateMask = true
            addRevealMaskAnimation()
        }
    }
    
    func setup() {
        self.image = UIImage(named: "logoInApp")
        self.contentMode  = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
        if let superview = self.superview {
            layoutActicve(with: superview)
        }
    }
    func layoutActicve(with superview: UIView) {
        NSLayoutConstraint.activate([
            self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            self.centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            self.widthAnchor.constraint(equalToConstant: 300),
            self.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func animation(wtth superview:UIView, x:CGFloat, y: CGFloat,showView: @escaping () -> Void ) {
        superview.constraints.forEach {
            if $0.firstItem as? UIView == self || $0.secondItem as? UIView == self {
                $0.isActive = false
            }
        }
        
        self.constraints.forEach{
            $0.isActive = false
        }
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: y - x),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: x),
            self.widthAnchor.constraint(equalToConstant: 80),
            self.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        UIView.animate(withDuration: 1.0) {
            superview.layoutIfNeeded()
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            showView()
        }
    }
    
    func addRevealMaskAnimation() {
       

        // Tạo một shape layer để làm mask
        let maskLayer = CALayer()
            maskLayer.backgroundColor = UIColor.black.cgColor
            maskLayer.anchorPoint = CGPoint(x: 0.0, y: 0.5) // mở từ trái sang phải
            maskLayer.position = CGPoint(x: 0, y: self.bounds.midY)
            maskLayer.bounds = CGRect(x: 0, y: 0, width: 0, height: self.bounds.height)
            
            self.layer.mask = maskLayer

            // Animation mở rộng bounds.width
            let animation = CABasicAnimation(keyPath: "bounds.size.width")
            animation.fromValue = 0
            animation.toValue = self.bounds.width
            animation.duration = 2.0
            animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            animation.fillMode = .forwards
            animation.isRemovedOnCompletion = false

            maskLayer.add(animation, forKey: "revealAnimation")
            
            // Quan trọng: set lại bounds cuối cùng để giữ kết quả
            maskLayer.bounds.size.width = self.bounds.width
    }
}
