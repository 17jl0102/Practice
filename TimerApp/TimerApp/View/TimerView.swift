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
    
    var delegate: TimerViewDelegate?
    var timer: Timer?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
    }
    
    @IBAction func timerBottun(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countdown), userInfo: nil, repeats: true)
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
    
    @objc func countdown() {
        var setTime = delegate?.setTimer()
        setTime = 10
    }
    
    func delegate?.endTimer() = {
}
