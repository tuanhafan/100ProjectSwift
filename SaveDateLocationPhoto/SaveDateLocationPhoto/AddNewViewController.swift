//
//  AddNewViewController.swift
//  SaveDateLocationPhoto
//
//  Created by AlexTran on 10/02/2025.
//

import UIKit

class AddNewViewController: UIViewController {
    @IBOutlet var lbltime:UILabel!
    @IBOutlet var tvContent: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpToolBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(addPostAction))
        
    }
    
    @objc func addPostAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func locationTapped() {
        print("Location button tapped!")
    }
    func setUpToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

        // Tạo icon hình ảnh
        let imageView = UIImageView(image: UIImage(systemName: "photo"))
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        let imageItem = UIBarButtonItem(customView: imageView)

        // Tạo label hiển thị text
        let label = UILabel()
        label.text = "Chọn nội dung"
        label.textAlignment = .center
        let labelItem = UIBarButtonItem(customView: label)

        // Tạo nút location
        let locationButton = UIButton(type: .system)
        locationButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
        locationButton.addTarget(self, action: #selector(locationTapped), for: .touchUpInside)
        let locationItem = UIBarButtonItem(customView: locationButton)

        // Thêm khoảng cách giữa các item
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        // Gán các item vào toolbar
        toolbar.items = [imageItem, flexibleSpace, labelItem, flexibleSpace, locationItem]

        // Gán toolbar vào bàn phím của textField hoặc textView
        tvContent!.inputAccessoryView = toolbar

        
    }
    

}

