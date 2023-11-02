//
//  TaskModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/30/23.
//

import Foundation

//create a model for each todo

struct Task: Codable, Identifiable {
    var id = UUID()
    var content: String // each individual task
    // has a tag for the topic it is under
    var topics: [Topic]
    
}

struct Topic: Codable,Identifiable {
    var id = UUID()
    var topic: String
}

