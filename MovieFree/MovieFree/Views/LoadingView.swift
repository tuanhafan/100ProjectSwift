//
//  LoadingView.swift
//  TixAura
//
//  Created by Alex Tran on 6/5/25.
//

import UIKit

class LoadingView: UIView {
    
    private let activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.color = .white
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        // Thiết lập lớp phủ mờ
        
        translatesAutoresizingMaskIntoConstraints = false
        
        // Thêm activity indicator vào view
        addSubview(activityIndicator)
        
        // Thiết lập constraints để đặt activity indicator ở giữa
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        // Bắt đầu animation
        activityIndicator.startAnimating()
    }
    
    // Hàm để hiển thị loading view trên một view cha
    static func show(in parentView: UIView, alpha:CGFloat? = 0.5) -> LoadingView {
        let loadingView = LoadingView()
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(alpha!)
        parentView.addSubview(loadingView)
      
        // Thiết lập constraints để phủ toàn màn hình
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: parentView.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            loadingView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
            loadingView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor)
        ])
        
        return loadingView
    }
    
    // Hàm để ẩn loading view
    func hide() {
        activityIndicator.stopAnimating()
        removeFromSuperview()
    }
}
