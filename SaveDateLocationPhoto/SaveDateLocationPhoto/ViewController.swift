//
//  ViewController.swift
//  SaveDateLocationPhoto
//
//  Created by AlexTran on 10/02/2025.
//

import UIKit

struct Post {
    let image: String
    let time: String
    let location: String
    let content: String
}

let posts: [Post] = [
    Post(image: "flower16", time: "08:30 AM", location: "Hà Nội", content: "Buổi sáng đẹp trời! Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "09:15 AM", location: "TP. Hồ Chí Minh", content: "Đi cà phê sáng.Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "10:45 AM", location: "Đà Nẵng", content: "Tham quan biển.Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "12:00 PM", location: "Hội An", content: "Ăn trưa với đặc sản.Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "02:30 PM", location: "Huế", content: "Tham quan Đại Nội.Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "04:00 PM", location: "Nha Trang", content: "Tắm biển cực đã!Buổi sáng đẹp trời!Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "05:45 PM", location: "Đà Lạt", content: "Trời bắt đầu lạnh rồi.Buổi sáng đẹp trời!Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "07:00 PM", location: "Cần Thơ", content: "Ăn tối trên du thuyền.Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "09:20 PM", location: "Hải Phòng", content: "Dạo phố về đêm.Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!"),
    Post(image: "flower16", time: "11:00 PM", location: "Vũng Tàu", content: "Kết thúc một ngày dài.Buổi sáng đẹp trời!Buổi sáng đẹp trời!Buổi sáng đẹp trời!")
]

class ViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addNewPost))
    }

    @objc func addNewPost () {
        performSegue(withIdentifier: "add", sender: nil)
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item:Post = posts[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        cell.avatar.image = UIImage(named: "\(item.image)") ?? UIImage(systemName: "person.circle")
        cell.lblTime.text = item.time
        cell.lblConten.text = item.content
        cell.lblLocation.text = item.location
        return cell
    }
}

class CustomCell : UITableViewCell {
    let avatar : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let lblConten : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblTime : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let lblLocation : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stackView.addArrangedSubview(lblTime)
        stackView.addArrangedSubview(lblConten)
        stackView.addArrangedSubview(lblLocation)
        contentView.addSubview(avatar)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 10),
            avatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 40),
            avatar.heightAnchor.constraint(equalToConstant: 40),
            
            stackView.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        }
}
