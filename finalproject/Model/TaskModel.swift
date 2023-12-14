//
//  TaskModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/30/23.
//

import Foundation
import SwiftData

//create a model for each todo

// the class makes sure that the variables are accesible
@Model
class Task: Identifiable, ObservableObject {
    var id = UUID()
    var content: String // each individual task
    @Relationship(deleteRule: .cascade) var topics = [Topic]()
    // has a tag for the topic it is under
    init(){ // gives data for model to pull (empty)
        content=""
        topics=[Topic(TopicType.topicOne.rawValue),Topic(TopicType.topicFour.rawValue), Topic(TopicType.topicTwo.rawValue),Topic(TopicType.topicThree.rawValue)]
    }
    
    init(content: String, topics: [Topic]){
        self.content = content
        self.topics = topics
    }
    
}

@Model
class Topic: Identifiable {
    var id = UUID().uuidString
    var topic: String
    var counter: Int = 0
    init(_ topic: String){ // gives data for model to pull
        self.topic=topic
    }
}

class Todo: Hashable{
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        return lhs.id == rhs.id
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


