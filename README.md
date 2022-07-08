# 계란 알람

만들면서 알게된것. 
Label 에 Lines 수를 0 으로 하면 글자 수 의 제한이 없다. 


Autoshrink 를 Minimum Font Size 로 한후 최소 라인 수를 결정 하여 그 최소줄 까지 내려갈 수 있다.

    @IBAction func eggButtonPressed(_ sender: UIButton) {
        print(sender.currentTitle)
    }
    
    currentTitle 로 버튼의 타이틀을 확인 할 수 있다. 
    

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true) 
        타이머 인터벌 1초 간격 으로 반복 true selector 함수 <- 오브젝트 씨 의 잔재 
            @objc func updateTimer() {
        if secondsRemaining > 0 {
            print("\(secondsRemaining) seconds.")
            secondsRemaining -= 1
        }
    }
    
    해당 어플을 연습하다 보니 이상한 문제가 있는걸 확인했다. 
    
    먼저 한 차례 계란 타이머를 돌리고 난 후 다른 계란 타이머를 하면  마지막 시간을 이어 받은 상태로 진행한다.
    
    예를 들어  3초 후 알람이 울리고 다음 7초 짜리를 하면 3초부터 3....4...5...6..7 알람! 이런식이다 . 
    이는 내 착각이였다. timer.invalidate() 가 타이머를 종료 시켜준다 하여 저 지나는 초 마저 0으로 초기화 하는줄 알았다. 
    끝나고 나면 secondPassed 를 ㅔ\0 으로 초기화 하면 정상적으로 작동한다.
    
    
    
 ![Simulator Screen Recording - iPhone 11 - 2022-07-08 at 23 05 18](https://user-images.githubusercontent.com/101173361/178007991-dee43663-8253-4b43-9e2a-c163dbd451f6.gif)


