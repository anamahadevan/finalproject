//
//  DataModel.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/30/23.
//

import Foundation

class DataModel: ObservableObject{
    @Published var selectedTask: Task = Task(content: "ihateualex", topics: [Topic(TopicType.topicOne.rawValue)])
}

