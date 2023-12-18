//
//  TaskView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI
import SwiftData

struct TaskView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var tasks: [Task]
    @State private var taskInput: String = " "
    
    var body: some View {
        ZStack {
            VStack {
                
                TextField("new task..", text: $taskInput)
                
                List {
                    ForEach(tasks) { task in
                        // create seperate view for each todo bar
                        EachTaskView(task: task)
                    }.onDelete(perform: deleteTasks)
                    .listRowBackground(Color.accent)
                }
                .listStyle(.plain)
                .toolbar {
                    
                    ToolbarItem{ // edit/delete new tasks
                        EditButton()
                    }
                    
                    ToolbarItem { // add new tasks
                        Button(action: {
                            addTasks(content: taskInput, topics: [Topic(TopicType.topicTwo.rawValue)])
                        }){Label("", image: "plus").frame(width: 5, height:5).foregroundColor(Color.accent)}.aspectRatio(contentMode: .fit)
                    }
                }
                
            
                
            }
            
        }
        .background(Color(UIColor.background))
    }
    
    /////// adding and deleting tasks
    
    private func addTasks(content: String, topics: [Topic]) {
        // adding new task to task array
        withAnimation {
            let newTask = Task(content: content, topics: topics)
            modelContext.insert(newTask)
        }
    }

    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(tasks[index])
            }
        }
    }
}







