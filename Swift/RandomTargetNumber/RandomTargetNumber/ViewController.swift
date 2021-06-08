//
//  ViewController.swift
//  RandomTargetNumber
//
//  Created by 박연배 on 2021/06/07.
//

import UIKit

class ViewController: UIViewController {
    
    func reset() {                                  // 초기값 설정
        print("reset!")
        randomValue = Int.random(in: 0...30)        // 찾아야 하는 수를 담아두는 변수
        tryCount = 0                                // 사용자가 시도한 횟수를 담아두는 변수
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
    
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    @IBAction func findSilderValue(_ sender: UISlider) {        // 현재 슬라이더가 위치한 곳의 값을 전달받아, 그 값을 연결된 레이블로 보여주는 메소드
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    
    func showAlert(message: String) {                           // 알럿창을 띄워주는 메소드
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { action in
                                        self.reset()
        }
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {       // 사용자가 HitButton을 눌렀을 때 일어나는 메소드
        print(Int(slider.value))
        let hitValue: Int = Int(slider.value)                   // Hitbutton을 눌렀을 때, 슬라이더의 정수부분을 저장하는 hitValue변수
        slider.value = Float(hitValue)                          // 슬라이더 위치를 조정하기 위해 hitValue를 실수형으로 캐스팅한 뒤 슬라이더 값에 대입
        
        tryCount += 1
        tryCountLabel.text = "\(tryCount) / 5"
        if tryCount >= 5 {
            showAlert(message: "You Lose....")
            reset()
            return
        }
        
        if hitValue == randomValue {
            showAlert(message: "You Hit!!")
            reset()
            return
        }
        else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        }
        else if randomValue < hitValue {
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = String(hitValue)
        }
    }

    @IBAction func touchUpResetButton(_ sender: UIButton) {     // 사용자가 reset버튼을 눌렀을 때, 초기값으로 되돌리는 메소드
        print("touch up reset button")
        reset()
    }
    
    
}

