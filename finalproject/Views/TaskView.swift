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
        NavigationSplitView {
            
            TextField("new task..", text: $taskInput)
            
            List {
                ForEach(tasks) { task in
                    // create seperate view for each todo bar
                    
                    Text("will have view here")
                }
                .onDelete(perform: deleteTasks)
            }
            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
                ToolbarItem {
                    Button(action: {
                        addTasks(content: taskInput, topics: [Topic(topic: "topic1")])
                                       }) {
                                           Label("Add Item", systemImage: "plus")
                                       }
                }
            }
        } detail: {
            Text("Select an item")
        }
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






#Preview {
    HomeView()
}
