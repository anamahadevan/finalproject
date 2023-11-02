//
//  ContentView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/24/23.
//

import SwiftUI

struct HomeView: View {
    
    //calling in view model, not instantiating
    @ObservedObject var viewModel = TaskViewModel()
    
    // create view model for opening screen
    var body: some View {
        NavigationView {
            VStack {
                // HSTACK here with offset
                NavigationLink(destination: TimerView()) {
                    // circle background here
                    Text("Timer")
                } // add background color to link
           
            
                NavigationLink(destination: TaskView()) {
                    Text("Tasks")
                }
                
                NavigationLink(destination: ProgressView()) {
                    // circle background here
                    Text("Progress")
                } // add background color to link
           
            
                NavigationLink(destination: SettingsView()) {
                    Text("Settings")
                }
                
            
            }
        }
    }
}

#Preview {
    HomeView()
}
