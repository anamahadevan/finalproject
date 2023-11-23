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
    
    @StateObject private var vm = TimerClass()
    @Query private var tasks: [Task]
    @Query private var topics: [Topic]
    @State var selectedTask: Task = Task()
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private let width: Double = 250
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                
//                select which task
//                Picker("Topic: ", selection: $selectedTask) {
//                    ForEach(task, id: \.self) {
//                        Text($0.task)
//                    }
//                }
                
                List {
                    ForEach(tasks) { task in
                        Text("\(task.content)")
                            .onTapGesture {
                                selectedTask = task
                                for topic in topics {
                                    if (topic.topic == selectedTask.topics.first?.topic) {
                                        topic.counter = 0
                                    }
                                }
                            }
                    }
                }
                
                //temporary timer code
                 Text("\(vm.time)")
                     .font(.system(size: 70, weight: .medium, design: .rounded))
                     .foregroundColor(Color.white)
                // alert for timer completion
                     .alert("timer has finished!", isPresented: $vm.showingAlert) {
                         Button("Continue", role: .cancel) {
                    
                         }
                     }
                     .padding()
                     .frame(width: width)
                     .background(.thinMaterial)
                     .cornerRadius(20)
                     
                // current control for the timer duration , trying to figure out how to make this set times that i can shift in between??
                 Slider(value: $vm.minutes, in: 1...10, step: 1)
                     .padding()
                     .disabled(vm.isActive)
                     .animation(.easeInOut, value: vm.minutes)
                     .frame(width: width)
                
                // timer controls
                 HStack(spacing:50) {
                     Button {
                         vm.start(minutes: vm.minutes)
                     } label: {
                         Image( "play").resizable()
                             .frame(width: 45.30544, height: 51.78119)
                     }
                     .disabled(vm.isActive)
      
                     Button(action: vm.reset){
                         Image("reset").resizable()
                             .frame(width: 45.30544, height: 51.78119)
                     }
                     
                     
                 }
                 .frame(width: width)
            }
            .padding(.horizontal, 70.0)
            .padding(.vertical, 200.0)
             .onReceive(timer) { _ in
                 vm.currTime()
             }
             .onAppear {
                 modelContext.insert(Topic(topic: "Topic 1"))
                 modelContext.insert(Topic(topic: "Topic 2"))
             }
        }
        .background(Color(UIColor.background)
            .ignoresSafeArea())     }
    
}



#Preview {
    TimerView()
}
