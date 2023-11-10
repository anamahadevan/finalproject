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
            GeometryReader { geometry in
                VStack{
                    
                    HStack{
                        
                        NavigationLink(destination: TaskView()) {
                            Image( "tasks").resizable()
                                .padding(.horizontal, 4.0)
                                .frame(width: 120, height: 112)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: ProgressView()) {
                            // circle background here
                            Image("progress").resizable()
                                .frame(width: 110, height: 108)
                            
                        }
                    }.padding(.vertical, 31.0)
                    
                
                    
                    
                    HStack{
                        Image("logo").resizable()
                            .frame(width: 296, height: 283)
                    }
                    .padding(.vertical, 80.0)
                    
                  
                    
                    HStack{
                        // HSTACK here with offset
                        
                        NavigationLink(destination: SettingsView()) {
                            Image("tasks").resizable()
                                .frame(width: 110, height: 108)
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: TimerView()) {
                            Image( "progress").resizable()
                                .frame(width: 110, height: 108)
                        }
                        
                    } .padding([.bottom, .trailing], 30)
                    
                }
                .padding(.horizontal, 10.0)
                
            }
            .background(Color(UIColor.background)
                .ignoresSafeArea())
        }
    }
}

#Preview {
    HomeView()
}
