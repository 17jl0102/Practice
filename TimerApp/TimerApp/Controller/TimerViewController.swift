//
//  ViewController.swift
//  TimerApp
//
//  Created by 角谷　悠平 on 2021/04/24.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerView: TimerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerView.delegate = self
    }
}

extension TimerViewController: TimerViewDelegate {
    func setTimer() -> Int {
        return 10
    }

    func endTimer() {
        self.view.backgroundColor = .red
    }
    
    func resetTimer() {
        self.view.backgroundColor = .white
    }
}
