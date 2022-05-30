//
//  MakeTaskViewController.swift
//  Timer
//
//  Created by macbook air on 2022/05/27.
//

import UIKit

protocol MakeTaskViewSettingDelegate: AnyObject {
    func chagedSetting(taskName: String?, duration:Int, hour:Int, minutes:Int, seconds:Int)
}

class MakeTaskViewController: UIViewController {
    
    weak var delegate: MakeTaskViewSettingDelegate?
    
    var duration = 60 //타이머의 설정된 시간을 초로 저장
    var currentSeconds = 0
    var Hour:Int = 0
    var Minutes:Int = 0
    var Seconds:Int = 0
    
    
    @IBOutlet weak var setTaskNameTextField: UITextField!
    @IBOutlet weak var setTaskTimePicker: UIDatePicker!
    
    
    @IBAction func tapCancleButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapConfirmButton(_ sender: Any) {
        
        self.duration = Int(self.setTaskTimePicker.countDownDuration)
        //debugPrint(self.duration)
        self.Hour = self.duration / 3600
        self.Minutes = (self.duration % 3600) / 60
        self.Seconds = (self.duration % 3600) % 60
        
        delegate?.chagedSetting(
            taskName: self.setTaskNameTextField.text,
            duration: self.duration,
            hour: self.Hour,
            minutes: self.Minutes,
            seconds: self.Seconds
        )
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
}
