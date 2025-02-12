//
//  AddUserViewController.swift
//  TodoList
//
//  Created by AlexTran on 07/02/2025.
//

import UIKit

class AddUserViewController: UIViewController {

    @IBOutlet weak var avatar : UIImageView!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    @IBOutlet weak var tfCarrer: UITextField!
    @IBOutlet weak var tvDes:UITextView!
    @IBOutlet weak var btnSubmit:UIButton!
    
    var person:Person? = Person(name: "User#08541", age: 18, avatar: "person", description: "No description", career: "Freelance")

    var delegate : AddPersonDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatar.isUserInteractionEnabled = true
        tvDes.addSubview(placeHolderDes)
        
        let tapGestureImage = UITapGestureRecognizer(target: self, action: #selector(selectImageAction))
        avatar.addGestureRecognizer(tapGestureImage)
        
        NotificationCenter.default.addObserver(self, selector: #selector(createperson), name: UITextField.textDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(createperson), name: UITextView.textDidChangeNotification, object: nil)

    }
    
    let placeHolderDes : UILabel = {
        let label = UILabel()
        label.text = "Add description here ..."
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
   @objc func createperson() {
       person?.name = tfName.text ?? "User#08541"
       person?.age = Int(tfAge.text ?? "18") ?? 18
       person?.career = tfCarrer.text ?? "Freelance"
       person?.description = tvDes.text ?? "No description"
    }
    
    @IBAction func addAction(_ sender: UIButton) {
     
        
        delegate?.addPerson(person!)
        navigationController?.popViewController(animated: true)
    }
   
}



extension AddUserViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @objc func selectImageAction (){

        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectImage = info[.editedImage] as? UIImage {
            avatar.image = selectImage
            let imageUrl = info[.imageURL] as? URL
            person?.avatar  = imageUrl!.lastPathComponent
        } else if let selectImage = info[.originalImage ] as? UIImage {
            avatar.image = selectImage
            let imageUrl = info[.imageURL] as? URL
            person?.avatar  = imageUrl!.lastPathComponent
        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
