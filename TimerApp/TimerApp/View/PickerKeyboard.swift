//
//  PickerKeyboard.swift
//  TimerApp
//
//  Created by 角谷　悠平 on 2021/05/22.
//

import UIKit

protocol PickerDelegate {
    func dieSelectTime(time: Int)
}

class PickerKeyboard: UIControl {
//    @IBOutlet weak var timerView: TimerView!
    let seconds:[Int] = ([Int])(1...300)
    var pickerView: UIPickerView?
    var keyboardView: UIView?
    var delegate: PickerDelegate?
    
//    timerview.setDelegate = self
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addTarget(self, action: #selector(tappedPickerKeyboard(_:)), for: .touchDown)
    }
    
    @objc private func tappedPickerKeyboard(_ sender: PickerKeyboard) {
        self.becomeFirstResponder()
    }
    
    //デフォルトがfalseでありtrue出ないとinputViewで指定のviewが表示できない為
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var inputView: UIView? {
      if let keyboardView = keyboardView {
        return keyboardView
      } else {
        let keyboardView = UIView()
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        keyboardView.backgroundColor = .gray
        keyboardView.autoresizingMask = [.flexibleHeight]
        keyboardView.addSubview(pickerView)
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView.topAnchor.constraint(equalTo: keyboardView.topAnchor).isActive = true
        pickerView.bottomAnchor.constraint(equalTo: keyboardView.bottomAnchor).isActive = true
        pickerView.leadingAnchor.constraint(equalTo: keyboardView.leadingAnchor).isActive = true
        pickerView.trailingAnchor.constraint(equalTo: keyboardView.trailingAnchor).isActive = true
        self.keyboardView = keyboardView
        self.pickerView = pickerView
        return keyboardView
      }
    }
    
    override var inputAccessoryView: UIView? {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        view.frame = CGRect(x: 0, y: 0, width: frame.width, height: 45)
        
        let closeButton = UIButton(type: .custom)
        closeButton.setTitle("完了", for: .normal)
        closeButton.sizeToFit()
        closeButton.addTarget(self, action: #selector(tappedCloseButton(_:)), for: .touchUpInside)
        closeButton.setTitleColor(UIColor(red: 0, green: 0.5, blue: 1, alpha: 1.0), for: .normal)
        view.contentView.addSubview(closeButton)
        
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.widthAnchor.constraint(equalToConstant: closeButton.frame.size.width).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: closeButton.frame.size.height).isActive = true
        closeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        return view
    }
    
    @objc private func tappedCloseButton(_ sender: UIButton) {
        let index = pickerView?.selectedRow(inComponent: 0) ?? 0
        //pickerViewで選択された行の秒数を依頼元(TimerViewController)に渡してる
        delegate?.dieSelectTime(time: seconds[index])
        resignFirstResponder()
    }
}

extension PickerKeyboard: UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return seconds.count
    }
    
    func pickerView(_ pickerVeiw: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(seconds[row]) + "秒"
    }
}

//extension PickerKeyboard: TimeSetDelegate {
//    func ButtonHide() {
//        timerView.isHidden = true
//    }
//    
//    func ButtonDisplay() {
//        timerView.isHidden = false
//    }
//    
//
//}
