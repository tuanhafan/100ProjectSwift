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
    var currentDate = Date()
    var step = 15
    @IBOutlet weak var btnResfresh: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        startTimer()
    }
    func startTimer(){
        updateClock()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateClock), userInfo: nil, repeats: true)
    }
    
    @objc func updateClock() {
//
        var dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: currentDate)
        if let minute = dateComponents.minute, let second = dateComponents.second {
            let newSeconds = second + step
            
            if(newSeconds >= 60) {
               let exTraMinute = newSeconds / 60
               let reMainingSecond = newSeconds % 60
                
                dateComponents.minute = minute + exTraMinute
                dateComponents.second = reMainingSecond
            }
            else {
                dateComponents.second = newSeconds
            }
        }
        if let newCurrent = Calendar.current.date(from: dateComponents){
            currentDate = newCurrent
        }
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy, HH:mm:ss"
        lbShowDateTimer.text = formatter.string(from: currentDate)
    }
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    @IBAction func refreshAction(_ sender: Any) {
        step = (step == 15) ? 1 : 15
    }
}

