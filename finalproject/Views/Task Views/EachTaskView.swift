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
            Image("bmo").resizable().frame(width: 40,height: 40)
            TextField("enter new task", text: $task.content).foregroundColor(.brown)
            Picker("topic: ", selection: $task.topicType) {
                Text(TopicType.topicFour.rawValue).tag(TopicType.topicFour).foregroundColor(.brown)
                Text(TopicType.topicOne.rawValue).tag(TopicType.topicOne).foregroundColor(.brown)
                Text(TopicType.topicTwo.rawValue).tag(TopicType.topicTwo).foregroundColor(.brown)
                Text(TopicType.topicThree.rawValue).tag(TopicType.topicThree).foregroundColor(.brown)
            }.accentColor(.brown)
            
        }.clipShape(Capsule())
    }
}
