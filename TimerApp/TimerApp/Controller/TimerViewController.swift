//
//  ViewController.swift
//  TimerApp
//
//  Created by 角谷　悠平 on 2021/04/24.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerView: TimerView!
    @IBOutlet weak var pickerView: PickerKeyboard!
    
    var setTime = 0 {
        didSet {
        }
            //Timer ViewにresetDataというFunctionを定義しそれを呼び出す
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerView.delegate = self
    }
}

extension TimerViewController: TimerViewDelegate {
    func setTimer() -> Int {
        return self.setTime
    }

    func endTimer() {
        self.view.backgroundColor = .red
    }
    
    func resetTimer() {
        self.view.backgroundColor = .white
    }
}
