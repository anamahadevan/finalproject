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
            Picker("Topic: ", selection: $task.topicType) {
                Text(TopicType.topicFour.rawValue).tag(TopicType.topicFour)
                Text(TopicType.topicOne.rawValue).tag(TopicType.topicOne)
                Text(TopicType.topicTwo.rawValue).tag(TopicType.topicTwo)
                Text(TopicType.topicThree.rawValue).tag(TopicType.topicThree)
            }
            
            Text(task.topics.description)
        }
    }
}
