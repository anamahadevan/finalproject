//
//  TaskModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/30/23.
//

import Foundation
import SwiftData

//create a model for each todo

//User defaults workflow:

//UserDefaults.standard.set(value: 5,forKey: "age")
//



// the class makes sure that the variables are accesible
@Model
class Task: Identifiable {
    var id = UUID()
    var content: String // each individual task
    @Relationship(deleteRule: .cascade) var topics = [Topic]()
    // has a tag for the topic it is under
    init(){ // gives data for model to pull (empty)
        content=""
        topics=[Topic(topic:"mobile app dev"),Topic(topic:"front end dev"), Topic(topic:"form")]
    }
    
    init(content: String, topics: [Topic]){
        self.content = content
        self.topics = topics
    }
    
}

@Model
class Topic: Identifiable {
    var id = UUID()
    var topic: String
    var counter: Int = 0
    init(topic: String){ // gives data for model to pull
        self.topic=topic
    }
}


/*
 Initial app state is ponadora timer.
 After 25 minutes go to break 1 then back then to break 2
 Every time you run the timer you select a task.
 Everytime that timer runs add to the counter of the progress page. 
 */
