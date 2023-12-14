//
//  EachTaskView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/7/23.
//

import SwiftUI

struct EachTaskView: View {
    //bindable makes manipulatable
    @Bindable var task: Task
//    @State private var selectedTopic = Topic("")
    
    var body: some View {
        HStack{
            TextField("enter new task", text: $task.content)
            Picker("Topic: ", selection: $task.topics) {
                Text(TopicType.topicFour.rawValue).tag(Topic(TopicType.topicFour.rawValue))
                Text(TopicType.topicOne.rawValue).tag(Topic(TopicType.topicOne.rawValue))
                Text(TopicType.topicTwo.rawValue).tag(Topic(TopicType.topicTwo.rawValue))
                Text(TopicType.topicThree.rawValue).tag(Topic(TopicType.topicThree.rawValue))
            }
        }
    }
}
