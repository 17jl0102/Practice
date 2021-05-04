//
//  ViewController.swift
//  TimerApp
//
//  Created by 角谷　悠平 on 2021/04/24.
//

import UIKit

class TimerViewController: UIViewController {

    var timerView = TimerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerView.setTime = timerView.delegate?.setTimer() ?? 0
        timerView.timeLabel.text = String(timerView.setTime)
    }

}
extension TimerViewController: TimerViewDelegate {
    func setTimer() -> Int {
        return 10
    }
    
    func endTimer() {
        view.backgroundColor = .red
    }
    
        
    }

