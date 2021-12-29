//
//  ViewController.swift
//  idealKadai6
//
//  Created by 中野翔太 on 2021/12/29.
//

import UIKit

//enumを使ってみる
private enum Message {
    static let  hit = "あたり!\nあなたの値"
    static let lost = "はずれ!\nあなたの値"
}
//finalキーワードで承継とオーバーライド禁止にしている
final class ViewController: UIViewController {
    
    @IBOutlet private weak var outputLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
        valueChange()
    }
   private var get: Int = 0
    
    
    
    @IBAction func decision(_ sender: Any) {
        let slider = Int(slider.value)
        if get == slider {
            actionAlert(message: Message.hit, value: slider)
        } else {
            actionAlert(message: Message.lost, value: slider)
        }
    }
    
    private func valueChange() {
        get = Int.random(in: 1 ... 100)
        outputLabel.text = String(get)
    }
    
    private func actionAlert(message: String, value: Int) {
        let alert = UIAlertController(
            title: "結果",
            message: "\(message) \(value)",
            preferredStyle: .alert
        )
        //[weak self] _ in self?メモリリークについて理解する
        alert.addAction(UIAlertAction(title: "再挑戦", style: .default, handler:  { [weak self] _ in self?.valueChange()}))
        present(alert, animated: true, completion: nil)
    }
    
    
}

