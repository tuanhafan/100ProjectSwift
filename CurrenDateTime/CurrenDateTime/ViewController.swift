//
//  ViewController.swift
//  CurrenDateTime
//
//  Created by AlexTran on 04/02/2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbShowDateTimer: UILabel!
    @IBOutlet weak var lbinFor: UILabel!
    var timer:Timer?
    let getDate = Date()
    let calender = Calendar.current
    var text:String = ""
    var step:Int = 5
    var currentSc : Int = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let dateComponent = calender.dateComponents([.year,.month,.day], from: getDate)
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "MMM"
        text = "\(dateFormatter.string(from: getDate)) \(dateComponent.day!), \(dateComponent.year!), "
        startTimer()
    }
    func startTimer(){
        updateClock()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }

    @objc func updateClock() {
        let timeFormatter = DateFormatter()
        let hour = calender.component(.hour, from: getDate)
        let minute = calender.component(.minute, from: getDate)
        let second = Calendar.current.component(.second, from: Date())
        timeFormatter.dateFormat = "HH:mm:ss"
        
        currentSc = second + 5
        if(currentSc >= 60){
            currentSc = 1
        }
        print(currentSc)
        lbShowDateTimer.text = "\(text)\(String(format: "%2d:%2d:%2d", hour,minute,currentSc))"
    }
    deinit {
        timer?.invalidate()
        timer = nil
    }
}

