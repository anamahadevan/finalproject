//
//  DataModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/30/23.
//

import Foundation

class DataModel: ObservableObject{
    @Published var selectedTask: Task = Task(content: "ihateualex", topics: [Topic(TopicType.front.rawValue)])
    
    @Published var timer1 = Date()
    @Published var timer2 = Date()
    @Published var timer3 = Date()
    
    init(){
        timer1 = Date(timeIntervalSince1970: TimeInterval(UserDefaults.standard.integer(forKey: "timer1")))
        timer2 = Date(timeIntervalSince1970: TimeInterval(UserDefaults.standard.integer(forKey: "timer2")))
        timer3 = Date(timeIntervalSince1970: TimeInterval(UserDefaults.standard.integer(forKey: "timer3")))
        
    }
    
    func saveTimerSettings(){
        UserDefaults.standard.setValue(Int(timer1.timeIntervalSince1970), forKey: "timer1")
        UserDefaults.standard.setValue(Int(timer2.timeIntervalSince1970), forKey: "timer2")
        UserDefaults.standard.setValue(Int(timer3.timeIntervalSince1970), forKey: "timer3")
    }
    
}

