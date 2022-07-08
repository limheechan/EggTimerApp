//
//  ViewController.swift
//  eggTimer
//
//  Created by 임희찬 on 2022/07/08.
//

import UIKit
import AVFAudio
class ViewController: UIViewController {
    var player: AVAudioPlayer!
    
    let eggTimes = ["Soft" : 3, "Medium" : 4, "Hard" : 7 ]
    
    //var secondsRemaining = 60
    var totalTime = 0
    var secondsPassed = 0
    
   var  timer = Timer()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    
    @IBAction func eggButtonPressed(_ sender: UIButton) {
        
        //타이머 중지 왜? 이걸 사용하느냐 처음 누른 버튼에서 이미 타이머가 진행 되고 있다 그때. 다른 버튼을 누루면 기존 타이머의 기능을 제거 하기 위함 으로 보인다.
        timer.invalidate()
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        //현재 남은 시간 % 1.0
        //progress.progress =
//        switch time {
//            case 5:
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
//                self.playSound()
//            }
//            case 7:
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 7) {
//                self.playSound()
//            }
//            case 12:
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 12) {
//                self.playSound()
//            }
//            default:
//                print("err")
//        }

    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime  {
            
            let percentProgress = Float(secondsPassed) / Float(totalTime)// why result is 0 ?
            print(percentProgress)
            progress.progress = Float( percentProgress)
            secondsPassed += 1
            titleLabel.text = "\( totalTime - secondsPassed ) 초 남았습니다."
            
        } else {
            timer.invalidate()
            titleLabel.text = "🥚완🥚성🥚"
            progress.progress = 1.0
            playSound()
            secondsPassed = 0
        }
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
       
    }
    
}

