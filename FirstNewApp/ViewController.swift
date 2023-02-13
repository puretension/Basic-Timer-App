//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 이도형 on 2023/02/13.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {


    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number = 0
    
//    let step: Float = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //mainLabel.text = "초를 선택하세요"
        configureUI() //함수로 빼서 사용 => 실무에서는 이렇게 처리, 코드 가독성
       
    }
    
    func configureUI() {
        mainLabel.text = "초를 선택하세요"
        slider.value = 0.5 //slider 가운데 설정
        
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        //slider값이 변할때마다 영향 받을 코드 작성
        //(slider의 value값으로 메인레이블 텍스트 셋팅)
//        let seconds = Int(slider.value * 60) //slider.value는 0~1사이의 Float
//        mainLabel.text = "\(seconds)초"
//        number = seconds
        number = Int(slider.value * 60)
        mainLabel.text = "\(number)초"
    }
    
    //self는 강한참조를 뜻함 => 서로를 가리킬 수도 있을텐데?
    
    @IBAction func startButtonTapped(_ sender: UIButton) { //startButton누르면?
        //1초씩 지나갈때마다 무언가를 실행
        //timer 방법1(원리는 동일함. 따로 빼놓은 함수를 1초간격 실행시키는 방식, 클로저가 어렵다면 이방식으로)
        timer?.invalidate() //timer상태 체크후, 비활성화 시키고
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfter1Second), userInfo: nil, repeats: true) //Timer라는 클레스를 사용, self는 뷰컨트롤러 의미, selector를 통해서 doSomethingAfter1Second함수와 연결되어있다. 1초간격으로 함수를 실행시킴

        //timer 방법2 (원리는 동일함. 클로저 1초간격 실행시키는방식)
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
//            <#code#>
//        })
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            //timer 방법1. 반복 하고 싶은 코드
//            if number > 0 {
//                number -= 1
//                //옵셔널 타입간의 연산이 불가하므로, 직접 계산 시켜 버림
//                //슬라이더도 줄여야됨
//                //레이블표시도 다시 해줘야됨
//                slider.value = Float(number) / Float(60)
//                // 숫자 계산해서 넣어줘야 함
//                mainLabel.text = "\(number)초"
//
//            } else {
//                number = 0
//                mainLabel.text = "초를 선택하세요"
//
//                //소리를 나게 해야함
//                timer?.invalidate() //0초시, timer도 죽여야함
//                AudioServicesPlayAlertSound(SystemSoundID(1322)) //system sound 코드
//            }
     
//        }
    }
    
  @objc func doSomethingAfter1Second() {
      if number > 0 {
          number -= 1
          //옵셔널 타입간의 연산이 불가하므로, 직접 계산 시켜 버림
          //슬라이더도 줄여야됨
          //레이블표시도 다시 해줘야됨
          slider.value = Float(number) / Float(60)
          // 숫자 계산해서 넣어줘야 함
          mainLabel.text = "\(number)초"
          
      } else {
          number = 0
          mainLabel.text = "초를 선택하세요"
          
          //소리를 나게 해야함
          timer?.invalidate() //0초시, timer도 죽여야함
          AudioServicesPlayAlertSound(SystemSoundID(1322)) //system sound 코드
      }
  }
    
  
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        //초기화 셋팅
        mainLabel.text = "초를 선택하세요"
//        let roundedValue = round(slider.value / step) * step
//        slider.value = roundedValue
        
        slider.value = 0.5
        
        number = 0
        timer?.invalidate()
        
//        slider.setValue(0.5, animated: true)
        
        //슬라이더의 가운데 설정
//        slider.setValue(0.5, animated: true)
//        slider.setThumbImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
    }
    
    
}

//결론적으로
//앱 만들기를 어떻게 접근할 것인가
//모르는 것을 어떻게 사용할 것인가
//window로 공식문서 보는법
//타이머 구현/ 셀렉터 사용법
//선그리기(Height 1)
//사운드 내는법
