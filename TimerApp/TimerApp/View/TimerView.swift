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
}

@IBDesignable
class TimerView: UIView {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var timerButton: UIButton!
    
    var delegate: TimerViewDelegate? {
        didSet {
            self.setTime = delegate?.setTimer() ?? 0
        }
    }
    
    var timer: Timer?
    var setTime = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
    }
    
    @IBAction func didTapTimerControl(_ sender: UIButton) {
        timerButton.setTitle("ストップ", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)}
        //スタート・ストップボタンの制御
  
    
    private func loadXib() {
        let timerView = Bundle.main.loadNibNamed("TimerView", owner: self, options: nil)?.first as! UIView
        timerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(timerView)
        
        
        timerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        timerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        timerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        timerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    @objc func countdown() {
        self.setTime -= 1
        timeLabel.text = String(setTime)
        if setTime == 0 {
            delegate?.endTimer()
            //タイマーを停止する処理
            timer?.invalidate()
            timeLabel.text = String(self.setTime)
        }
    }
}
