//
//  TimerView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI
import SwiftData

struct TimerView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State var currentMode: TimerMode = .break1
//    @StateObject private var vm = TimerClass()
    
    // The task will hold a topic name associated with the topic in swiftdata
    @Query var tasks: [Task]
    
    // Each topic will hold a name and a counter
    @Query var topics: [Topic]
    @EnvironmentObject var dataModel: DataModel
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    @StateObject var newTimerModel = NewTimerModel()
    
    func UpdateTopicCounter() {
        // Using selectedTask
        // selectedTask.Topics should have only selected topic
        // Get the selectedtopic name and search for it inside of swiftdata
        // @Query private var topics: [Topic]
        // Update the topic counter in swiftdata
        //        print("Finished")
        //        selectedTask?.topics[0].counter += 1
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {

       
                // topic selection, if its empty, the picker wont display
                if tasks.isEmpty {
                    EmptyView() // add a link to navigation here
                }
                else { // picker
                    HStack {
                        Picker("Tasks", selection: $dataModel.selectedTask) {
                                      ForEach(tasks, id: \.self) { task in
                                          Text(task.content).tag(task.id)
                            }
                        }.pickerStyle(MenuPickerStyle())
                    }  .padding(.top, 130)
                }
    

              //  timer stack
                ZStack{
                    
              
                    switch currentMode {
                    case .pom:
                        PomodoroView()
                    case .break1:
                        BreakOneView()
                    case .break2:
                        BreakTwoView()
                    }
                    
                    Text(newTimerModel.formattedTime)
                    
                }.font(.system(size: 30, weight: .medium, design: .rounded))
                .foregroundColor(Color.white)
                .background(Image("tomato").resizable().frame(width: 327, height: 325))
                .padding(.top, 150)
            
                
                // timer controls
                HStack(spacing:50) {
                    Button {
                        newTimerModel.startTimer()
                    } label: {
                        Image( "play").resizable()
                            .frame(width: 45.30544, height: 51.78119)
                    }
                    
                    Button(action: {newTimerModel.endTimer()}){
                        Image("reset").resizable()
                            .frame(width: 45.30544, height: 51.78119)
                    }
                }
                .frame(width: width)
                .padding(.top, 150)
            }  // end of stack
            .padding(.horizontal, 70.0)
            
            .onAppear {
                modelContext.insert(Topic(topic: "Topic 1"))
                modelContext.insert(Topic(topic: "Topic 2"))
            }
        }
        .task {
            
        }
        .background(Color(UIColor.background)
            .ignoresSafeArea())     }
}
//
//
//
//#Preview {
//    TimerView()
//}
