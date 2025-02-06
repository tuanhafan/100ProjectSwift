//
//  ViewController.swift
//  PhotoFromCameraRoll
//
//  Created by AlexTran on 05/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnCamera: UIBarButtonItem!
    @IBOutlet weak var imageVIew: UIImageView!
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func btnCameraAction(_ sender: UIButton) {
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.delegate = self
//        imagePicker.allowsEditing = true
        present(imagePicker,animated:true)
    }
    
    
}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.editedImage] as? UIImage {
            imageVIew.image = selectedImage
        } else if let selectedImage = info[.originalImage] as? UIImage {
            imageVIew.image = selectedImage
        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}
