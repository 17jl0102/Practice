//
//  XibView.swift
//  TimerApp
//
//  Created by 角谷　悠平 on 2021/04/24.
//

import UIKit

@IBDesignable
class TimerView: UIView {
    
    @IBOutlet weak var timeLabel: UILabel!

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadXib()
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
    
}
