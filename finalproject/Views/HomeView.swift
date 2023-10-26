//
//  ContentView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/24/23.
//

import SwiftUI

struct HomeView: View {
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
                
                NavigationLink(destination: TimerView()) {
                    // circle background here
                    Text("Timer")
                } // add background color to link
           
            
                NavigationLink(destination: TaskView()) {
                    Text("Tasks")
                }
                
            
            }
        }
    }
}

#Preview {
    HomeView()
}
