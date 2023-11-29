//
//  TimerModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/10/23.
//


import Foundation

enum TimerMode: String, CaseIterable{
    case pom
    case break1
    case break2
}


class NewTimerModel: ObservableObject{
    @Published var timeRemaining = 5
    @Published var todo: Todo = Todo()
    @Published var mode: TimerMode = .pom
    @Published var formattedTime: String = "00 : 00"
    var cases: [TimerMode] = [.pom, .break1,.pom, .break2]
    var modeIndex = 0
    var timer = Timer()
    
    init(){
        setupTimer()
    }
    func setupTimer(){ //Starts a timer
        timer = Timer(fire: Date(), interval: 1.0, repeats: true, block: { timerFired in
      //Fired every second
            self.timeRemaining -= 1
            if self.timeRemaining == 0{
                self.endTimer()
            }
            let (_,m,s) = self.secondsToHoursMinutesSeconds(self.timeRemaining)
            self.formattedTime = String(format: "%02d : %02d", m, s)
        })
        
    }
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func startTimer() {
        RunLoop.main.add(timer, forMode: .common)
    }
    func endTimer(){ //fired when timer ends
        timer.invalidate()
        if mode == .pom && todo.name != "Select a Todo"{
            todo.timesRun += 1
        }
        modeIndex += 1
        if modeIndex >= cases.count{
            //Finished everything
            
        }else{
            mode = cases[modeIndex]
            switch mode{
            case .pom:
                timeRemaining = 1500
            case .break1:
                timeRemaining = 300
            case .break2:
                timeRemaining = 900
            }
            
            setupTimer()
        }
        
    }
}
