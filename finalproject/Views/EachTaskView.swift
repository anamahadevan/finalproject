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
                Text(TopicType.algos.rawValue).tag(Topic(TopicType.algos.rawValue))
                Text(TopicType.front.rawValue).tag(Topic(TopicType.front.rawValue))
                Text(TopicType.mobile.rawValue).tag(Topic(TopicType.mobile.rawValue))
                Text(TopicType.study.rawValue).tag(Topic(TopicType.study.rawValue))
            }
        }
    }
}
