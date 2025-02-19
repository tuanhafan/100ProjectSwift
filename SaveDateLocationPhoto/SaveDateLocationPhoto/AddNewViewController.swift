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
    var addNewPostAction : ((_ : Post) -> Void)?
    let locationManager = CLLocationManager()
    
    var labelLocation = UILabel()
    var post : Post = Post(image: "flower16", time: "02:30 PM", location: "Hà Nội", content: "Hôm nay Thái BÌnh mưa phùn")
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpToolBar()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(addPostAction))
        tvContent.delegate = self
        tvContent.addSubview(placeHolder)
       
        let now = Date()
        post.time  = formatTime(date: now)
        
        NSLayoutConstraint.activate([
            placeHolder.topAnchor.constraint(equalTo: tvContent.topAnchor, constant: 10),
            placeHolder.leadingAnchor.constraint(equalTo: tvContent.leadingAnchor, constant: 5),
        ])
        
    }
    
    func formatTime(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mma"
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        return formatter.string(from: date)
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
//        navigationController?.popViewController(animated: true)
//        addNewPostAction?(post)
        print(post)
    }
    
    @objc func textViewChanged(notification:Notification) {
        if let textView = notification.object as? UITextView {
            print("in text view")
            post.content = textView.text
        }
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
    
    deinit{
        NotificationCenter.default.removeObserver(self)
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
                print(error)
                return
            }
            if let placemark = placeMarks?.first {
                let address = """
                    \(placemark.name ?? ""),
                    \(placemark.locality ?? ""),
                    \(placemark.administrativeArea ?? ""),
                    \(placemark.country ?? "")
                    """.replacingOccurrences(of: "\n", with: " ")
                self.post.location = address
                self.labelLocation.text = address
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
        self.labelLocation.text = "không thể lấy vị trí"
    }
}
