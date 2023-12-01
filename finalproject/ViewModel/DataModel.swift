//
//  DataModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/30/23.
//

import Foundation

class DataModel: ObservableObject{
    @Published var selectedTask: Task = Task(content: "ihateualex", topics: [Topic(topic: "fr")])
    
   @Published var timer1 = 1500
    @Published var timer2 = 1500
    @Published var timer3 = 1500
    
    init(){
        timer1 = UserDefaults.standard.integer(forKey: "timer1")
        timer2 = UserDefaults.standard.integer(forKey: "timer2")
        timer3 = UserDefaults.standard.integer(forKey: "timer3")
        
    }
    
    func saveTimerSettings(){
        UserDefaults.standard.setValue(timer1, forKey: "timer1")
        UserDefaults.standard.setValue(timer2, forKey: "timer2")
        UserDefaults.standard.setValue(timer3, forKey: "timer3")
    }
    
}

