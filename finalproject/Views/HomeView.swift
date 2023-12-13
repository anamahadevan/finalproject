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
    var testMode = true
    @StateObject var selectedTopic = Topic(String)
    // create view model for opening screen
    var body: some View {
//        if !testMode {
            NavigationView {
                GeometryReader { geometry in
                    VStack{
                        
                        HStack{
                            
                            NavigationLink(destination: TaskView()) {
                                Image( "tasks").resizable()
                                    .padding(.horizontal, 4.0)
                                    .frame(width: 120, height: 112)
                            }.offset( x: 30, y: 75)
                            
                            
                            Spacer()
                            
                            NavigationLink(destination: ProgressPageView()) {
                                // circle background here
                                Image("progress").resizable()
                                    .frame(width: 110, height: 108)
                                
                            }.offset( x: -15, y: 0)
                        }.padding(.vertical, 20.0)
                        
                        
                        
                        
                        HStack{
                            Image("logo")
                                .resizable()
                                .frame(width: 296, height: 283)
                        }
                        .padding(.vertical, 80.0)
                        
                        
                        
                        HStack{
                            // HSTACK here with offset
                            
                            NavigationLink(destination: SettingsView()) {
                                Image("settings").resizable()
                                    .frame(width: 110, height: 108)
                            }.offset( x: 20, y: -55)
                            
                            Spacer()
                            
                            NavigationLink(destination: TimerView()) {
                                Image( "timer").resizable()
                                    .frame(width: 110, height: 108)
                            }.offset( x: 20, y: 25)
                            
                        } .padding([.bottom, .trailing], 30)
                        
                    }
                    .padding(.horizontal, 10.0)
                    
                }
                .background(Color(UIColor.background)
                    .ignoresSafeArea())
            }
//        }else{
//            TimerViewExample(allTodos: [Todo(), Todo(name: "todo 1"), Todo(name: "todo 2")])
//        }
    }
}

#Preview {
    HomeView()
}
