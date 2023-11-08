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
    
    
    var body: some View {
        HStack{
            TextField("type jhere...", text: $task.content)
            Text(task.topics[0].topic)
            Picker("Topics", selection: $task.topics) {
                Text("mobile app dev").tag([Topic(topic: "mobile app dev")])
                Text("front end dev").tag([Topic(topic: "front end dev")])
                Text("form").tag([Topic(topic: "form")])
            }
            
        }
    }
}
