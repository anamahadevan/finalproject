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
    init(topic: String){ // gives data for model to pull
        self.topic=topic
    }
}


