//
//  TaskView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI



struct TaskView: View {
    
    //calling in view model, not instantiating
    @ObservedObject var viewModel = TaskViewModel()
    @State var taskContent = ""
    
    
    
    var body: some View {
    
        // creating a list of notes, by iterating over the 'Notes' array an
        List(viewModel.myTasks) {
            Text($0.content)
        }
        
    }
}

#Preview {
    HomeView()
}
