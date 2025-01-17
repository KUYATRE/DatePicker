//
//  ViewController.swift
//  DatePicker
//
//  Created by 이병곤 on 2024/07/07.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    var currentTime: String?
    var isAlertEnable = true
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        let alarmFormatter = DateFormatter()
        alarmFormatter.dateFormat = "HH:mm"
        alarmTime = alarmFormatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        //lblCurrentTime.text = String(count)
        //count = count + 1
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        let alarmFormatter = DateFormatter()
        alarmFormatter.dateFormat = "HH:mm"
        currentTime = alarmFormatter.string(from: date as Date)
        
        
        if (alarmTime == currentTime) {
            view.backgroundColor = UIColor.red
            if isAlertEnable {
                let timeMatchAlert = UIAlertController(title: "알림", message: "설정한 시간입니다!!!", preferredStyle: UIAlertController.Style.alert)
                let matchAction = UIAlertAction(title: "네, 알겠습니다", style: UIAlertAction.Style.default, handler: {
                    ACTION in self.isAlertEnable = false
                })
                
                timeMatchAlert.addAction(matchAction)
                
                present(timeMatchAlert, animated: true, completion: nil)
            }
        } else {
            view.backgroundColor = UIColor.white
            isAlertEnable = true
        }
    }
    
    @objc func compareTime() {
    }

}

