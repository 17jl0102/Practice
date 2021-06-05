//
//  XibView.swift
//  TimerApp
//
//  Created by 角谷　悠平 on 2021/04/24.
//

import UIKit

protocol TimerViewDelegate {
    func setTimer() -> Int
    func endTimer()
    func resetTimer()
}

protocol TimeSetDelegate {
    func ButtonHide()
    func ButtonDisplay()
}

@IBDesignable
class TimerView: UIView {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    private var timer: Timer?
    
    var setTime = 0 {
        didSet {
            timeLabel.text = String(setTime)
        }
    }
    
    var delegate: TimerViewDelegate? {
        didSet {
            self.setTime = delegate?.setTimer() ?? 0
        }
    }
    
    var setDelegate: TimeSetDelegate?
    
    enum timerStatus: String {
        case start
        case stop
        case reset
        case timeOver
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
    }
    
    
    
    @IBAction func didTapTimerControl(_ sender: UIButton) {
        
        if timer == nil {
            if setTime == 0 {
                setTime = delegate?.setTimer() ?? 0
                delegate?.resetTimer()
                timerButtonChangeTitle(status: .reset)
                
            } else {
                timerButtonChangeTitle(status: .start)
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
                setDelegate?.ButtonHide()
            }
        } else {
            timerButtonChangeTitle(status: .stop)
            timer?.invalidate()
            timer = nil
        }
    }
    
    private func timerButtonChangeTitle(status: timerStatus) {
        switch  status {
        case .start:
            timerButton.setTitle("ストップ", for: .normal)
        case .stop:
            timerButton.setTitle("スタート", for: .normal)
        case .reset:
            timerButton.setTitle("スタート", for: .normal)
        case .timeOver:
            timerButton.setTitle("リセット", for: .normal)
        }
    }
    
    private func loadXib() {
        let timerView = Bundle.main.loadNibNamed("TimerView", owner: self, options: nil)?.first as! UIView
        timerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timerView)
        
        
        timerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        timerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        timerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        timerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    @objc private func countdown() {
        self.setTime -= 1
        if setTime == 0 {
            delegate?.endTimer()
            //タイマーを停止する処理
            timer?.invalidate()
            timer = nil
            setDelegate?.ButtonDisplay()
            timerButtonChangeTitle(status: .timeOver)
        }
    }
    
    func resetData() {
        //TimerViewのsetTimeにTimerViewControllerのsetTimeを代入
        self.setTime = delegate?.setTimer() ?? 0
        timerButtonChangeTitle(status: .reset)
    }

}
