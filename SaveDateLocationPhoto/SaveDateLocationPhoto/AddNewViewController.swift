//
//  AddNewViewController.swift
//  SaveDateLocationPhoto
//
//  Created by AlexTran on 10/02/2025.
//

import UIKit
import CoreLocation

class AddNewViewController: UIViewController,UITextViewDelegate {
    @IBOutlet var lbltime:UILabel!
    @IBOutlet var tvContent: UITextView!
    let uiImagePicker = UIImagePickerController()
    var imageContent : UIImageView = UIImageView(image: UIImage(systemName: "photo"))
   
    let locationManager = CLLocationManager()
    
    var labelLocation = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpToolBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(addPostAction))
        tvContent.delegate = self
        tvContent.addSubview(placeHolder)
       
        NSLayoutConstraint.activate([
            placeHolder.topAnchor.constraint(equalTo: tvContent.topAnchor, constant: 10),
            placeHolder.leadingAnchor.constraint(equalTo: tvContent.leadingAnchor, constant: 5),
        ])
        print(labelLocation.text)
    }
    
    let placeHolder : UILabel = {
        let label = UILabel()
        label.text = "Add content ...."
        label.textColor = .lightGray
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    
    @objc func addPostAction() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func locationTapped() {
        setupLocationManager()
    }
    @objc func cameraTapped() {
        uiImagePicker.delegate = self
        uiImagePicker.sourceType = .photoLibrary
        present(uiImagePicker, animated: true)
    }
    func textViewDidChange(_ textView: UITextView) {
          placeHolder.isHidden = !textView.text.isEmpty
        }
    
    func setupLocationManager() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
    }

    func setUpToolBar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()

      
        let imageView = imageContent
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        let imageItem = UIBarButtonItem(customView: imageView)

        
       
        labelLocation.text = "Chọn Vị Trí"
        labelLocation.textAlignment = .left
        labelLocation.translatesAutoresizingMaskIntoConstraints = false
        labelLocation.widthAnchor.constraint(equalToConstant: 250).isActive = true
        let labelItem = UIBarButtonItem(customView: labelLocation)

        let locationButton = UIButton(type: .system)
        locationButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
        locationButton.addTarget(self, action: #selector(locationTapped), for: .touchUpInside)
        let locationItem = UIBarButtonItem(customView: locationButton)

        
        let cameraButton = UIButton(type: .system)
        cameraButton.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        cameraButton.addTarget(self, action: #selector(cameraTapped), for: .touchUpInside)
        let cameraItem = UIBarButtonItem(customView: cameraButton)
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

       
        toolbar.items = [cameraItem,flexibleSpace,locationItem, flexibleSpace, labelItem, flexibleSpace, imageItem]

       
        tvContent!.inputAccessoryView = toolbar

        
    }
    

}
extension AddNewViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let setImage = info[.editedImage] as? UIImage {
            imageContent.image = setImage
        } else if let setImage = info[.originalImage] as? UIImage {
            imageContent.image = setImage
        }
        dismiss(animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}

extension AddNewViewController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
            let latitude = location.coordinate.latitude
            let longtitude = location.coordinate.longitude
            
        getAddressFromLatLon(lat: latitude, lon: longtitude)
    }
    func getAddressFromLatLon(lat:Double,lon:Double) {
        let location = CLLocation(latitude: lat, longitude: lon)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location){
            (placeMarks, error) in
            if let  error = error {
                return
            }
            if let placemark = placeMarks?.first {
                let address = """
                    \(placemark.name ?? ""),
                    \(placemark.locality ?? ""),
                    \(placemark.administrativeArea ?? ""),
                    \(placemark.country ?? "")
                    """.replacingOccurrences(of: "\n", with: " ")
               
                self.labelLocation.text = address
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
        self.labelLocation.text = "không thể lấy vị trí"
    }
}
