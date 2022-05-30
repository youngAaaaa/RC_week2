//
//  ViewController.swift
//  Timer
//
//  Created by macbook air on 2022/05/27.
//

import UIKit

class ViewController: UIViewController, MakeTaskViewSettingDelegate {
    
    var secondsLeft: Int = 0
    
    @IBOutlet weak var taskView: UIView!
    @IBOutlet weak var mainTaskTime: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskTimeLabel: UILabel!
    
    @IBAction func tapTaskPlayButton(_ sender: Any) {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (t) in
            //남은 시간(초)에서 1초 빼기
            self.secondsLeft -= 1
            
            let hours = self.secondsLeft / 3600
            let minutes = (self.secondsLeft % 3600) / 60
            let seconds = (self.secondsLeft % 3600) % 60
            
            //남은 시간(초)가 0보다 크면
            if self.secondsLeft > 0 {
                self.taskTimeLabel.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
                self.mainTaskTime.text = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
            } else {
                self.taskTimeLabel.text = "끝!"
            }
        })
    }
    
    @IBAction func tapMakeTaskButton(_ sender: Any) {
        let vc = MakeTaskViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .overCurrentContext
        present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let makeTaskViewController = segue.destination as? MakeTaskViewController{
            makeTaskViewController.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNotificationPermission()
        taskView.layer.cornerRadius = CGFloat(20)
    }
    
    func chagedSetting(taskName: String?, duration: Int, hour: Int, minutes: Int, seconds: Int) {
        self.taskNameLabel.text = taskName
        self.secondsLeft = duration
        self.taskTimeLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
        self.mainTaskTime.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
    }
    
    func requestNotificationPermission(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow,Error in
        })
    }
    
}
