//
//  TimerViewExample.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/29/23.
//

import SwiftUI

class NewTimerModel: ObservableObject{
    @Published var timeRemaining = 5
    @Published var todo: Todo = Todo()
    @Published var mode: TimerMode = .pom
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
        })
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

struct TimerViewExample: View {

    @State var allTodos: [Todo]

    @StateObject var newTimerModel = NewTimerModel()

   
    var body: some View {
        VStack{
            Text(newTimerModel.timeRemaining.description)
            
            Text(newTimerModel.mode.rawValue)
            
            Picker("Topic: ", selection: $newTimerModel.todo) {
                ForEach(allTodos, id: \.self) {
                    Text($0.name)
                }
            }
            Text("Times ran for this todo: \(newTimerModel.todo.timesRun.description)")
        }
    }
    
}

#Preview {
    TimerViewExample( allTodos: [Todo(name: nil), Todo(name: "Item 1")])
}


class Todo: Hashable{
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        if lhs.id == rhs.id{
            return true
        }else{
            return false
        }
    }
    func hash(into hasher: inout Hasher) {
          hasher.combine(id)
   
      }
    var name: String

    var id = UUID().uuidString
    var timesRun: Int = 0
    init(name: String? = nil){
        guard name != nil else{
            //No todo selected
            self.name = "Select a Todo"
            return
        }
        self.name = name!
    }
    
    
}




enum TimerMode: String, CaseIterable{
    case pom
    case break1
    case break2
}
