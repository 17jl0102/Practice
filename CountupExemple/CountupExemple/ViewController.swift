//
//  ViewController.swift
//  CountupExemple
//
//  Created by 角谷　悠平 on 2020/11/01.
//

import UIKit

class ViewController: UIViewController {
    
    //カウントアップラベルの生成
    let countupLabel = UILabel()
    var count = 0 {
        didSet {
            countupLabel.text = String(count)
        }
    }
    
    //プラス１するメソッド
    @objc func plusButtonDidTapped(_ sender: UIButton) {
        count += 1
        print(count)
    }
    
    
    @objc func minusButtonDidTapped(_ sender: UIButton) {
        if count>0 {
            count -= 1
        }
        print(count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        //カウントアップラベルのデザイン
        countupLabel.backgroundColor = .systemTeal
        countupLabel.text = "0"
        countupLabel.font = UIFont.systemFont(ofSize: 30)
        countupLabel.textColor = .black
        countupLabel.textAlignment = NSTextAlignment.center
        countupLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(countupLabel)
        //カウントアップラベルのサイズと配置
        countupLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        countupLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        countupLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
        countupLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -200).isActive = true
        
        
        //プラスボタンの生成
        let plusButton = UIButton()
        //プラスボタンのデザイン
        plusButton.backgroundColor  = .red
        plusButton.setTitle("-", for: .normal)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        plusButton.setTitleColor(.white, for: .normal)
        plusButton.addTarget(self, action: #selector(minusButtonDidTapped(_:)), for: .touchUpInside)
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(plusButton)
        //プラスボタンのサイズと配置
        plusButton.widthAnchor.constraint(equalTo: countupLabel.widthAnchor, multiplier: 0.25).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        plusButton.leadingAnchor.constraint(equalTo: countupLabel.leadingAnchor, constant: 65).isActive = true
        plusButton.topAnchor.constraint(equalTo: countupLabel.bottomAnchor, constant: 150).isActive = true
        
        //マイナスボタンの生成
        let minusButton = UIButton()
        //マイナスボタンのデザイン
        minusButton.backgroundColor  = .blue
        minusButton.setTitle("＋", for: .normal)
        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        minusButton.setTitleColor(.white, for: .normal)
        minusButton.addTarget(self, action: #selector(plusButtonDidTapped(_:)), for: .touchUpInside)
        minusButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(minusButton)
        //マイナスボタンのサイズと配置
        minusButton.widthAnchor.constraint(equalTo: plusButton.widthAnchor).isActive = true
        minusButton.heightAnchor.constraint(equalTo: plusButton.heightAnchor).isActive = true
        minusButton.trailingAnchor.constraint(equalTo: countupLabel.trailingAnchor, constant: -65).isActive = true
        minusButton.topAnchor.constraint(equalTo: plusButton.topAnchor).isActive = true
    }
    
}

