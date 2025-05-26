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
    
    
       override init(frame: CGRect) {
            super.init(frame: frame)
           setup()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setup()
        }

    
    func setup(){
      
        self.translatesAutoresizingMaskIntoConstraints = false
        setupBlurEffect()
      
    }
    
    func layoutActive(wtth superview: UIView) {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: superview.topAnchor),
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            self.heightAnchor.constraint(equalToConstant: 80)
        ])
        self.layoutIfNeeded()
    }
    
    func setupBlurEffect() {
        let effect = UIBlurEffect(style: .dark)
              blurView.frame = self.bounds
                blurView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                blurView.effect = effect // bắt đầu là nil (ẩn)

               dimmingView.frame = self.bounds
               dimmingView.backgroundColor = UIColor.black.withAlphaComponent(0.25)
               dimmingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

               self.insertSubview(blurView, at: 0)
               blurView.contentView.addSubview(dimmingView)
    }
    
    func setBlurVisible(_ visible: Bool, animated: Bool = true) {
            let effect = visible ? UIBlurEffect(style: .systemUltraThinMaterialDark) : nil
            if animated {
                UIView.animate(withDuration: 0.25) {
                    self.blurView.effect = effect
                    self.dimmingView.alpha = visible ? 1.0 : 0.0
                }
            } else {
                blurView.effect = effect
                dimmingView.alpha = visible ? 1.0 : 0.0
            }
        }


}
