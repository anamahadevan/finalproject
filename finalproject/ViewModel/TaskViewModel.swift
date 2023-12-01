//
//  TaskViewModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/30/23.
//

import Foundation

class TaskViewModel: ObservableObject{
    //create list of notes, var so can add and delete
    var myTasks = [Task]()
    
    func newTasks(content: String, topics: [Topic]) {
        
        let newTask = Task(content: content, topics: topics)
        
        myTasks.append(newTask)
    }

}
