//
//  ViewController.swift
//  TimerApp
//
//  Created by 角谷　悠平 on 2021/04/24.
//

import UIKit

class TimerViewController: UIViewController {
    
    @IBOutlet weak var timerView: TimerView!
    @IBOutlet weak var pickerKeyboard: PickerKeyboard!
    
    var setTime = 0 {
        didSet {
            //依頼先から渡され値をsetTimeにセットしたときにresetData()を呼び出す
            timerView.resetData()
            view.backgroundColor = .black
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //「=」は右辺を左辺への代入
        //今回の場合、TimerViewControllerがdelegateに依頼している
        timerView.delegate = self
        pickerKeyboard.delegate = self
    }
}

extension TimerViewController: TimerViewDelegate {
    func setTimer() -> Int {
        //TimerViewControllerのsetTimeを返す
        return self.setTime
    }

    func endTimer() {
        self.view.backgroundColor = .red
    }
    
    func resetTimer() {
        self.view.backgroundColor = .black
    }
}

extension TimerViewController: PickerDelegate {
    func dieSelectTime(time: Int) {
        //依頼先から渡された値を自身のプロパティ(今回はsetTime)にセットする
        setTime = time
    }
}
