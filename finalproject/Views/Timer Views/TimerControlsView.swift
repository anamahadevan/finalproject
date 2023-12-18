//
//  TimerControlsView.swift
//  pomcat timer
//
//  Created by anabelle mahadevan on 12/18/23.
//
import SwiftUI
import SwiftData

struct TimerControlsView: View {
    
    // import tasks
    @Environment(\.modelContext) private var modelContext
    
    
    
    //each task will hold a topic name
    @Query var tasks: [Task]
    
    // each topic will hold a name and a counter
    @Query var topics: [Topic]
    @EnvironmentObject var dataModel: DataModel
    
    //timer refresh
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    @StateObject var newTimerModel = NewTimerModel()
    
    var body: some View {
        HStack(spacing: 35){ // timer controls
            
            Button {
                newTimerModel.startTimer()
            } label: {
                Image("play").resizable()
                    .frame(width: 45, height: 50)
            }
            
            Button(action: {newTimerModel.pauseTimer()}){
                Image("pause").resizable()
                    .frame(width: 45, height: 50)
            }
            
            Button {
                newTimerModel.endTimer()
                let key = dataModel.selectedTask.topicType.rawValue
                let count = UserDefaults.standard.integer(forKey: key)
                UserDefaults.standard.set(count+1, forKey: key)
                
                print(count, key)
            } label: {
                Image("skip").resizable()
                    .frame(width: 45, height: 50)
            }
        }  .padding()
            .background(Color.tomato,in: Capsule())
        

        
    }
}

#Preview {
    TimerControlsView()
}
