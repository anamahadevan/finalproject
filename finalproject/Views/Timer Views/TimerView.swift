
import SwiftUI
import SwiftData

struct TimerView: View {
    
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
    
    var body: some View{
        GeometryReader { geometry in
            
            VStack{
                // topic selection bar ; shows diff view when no tasks are added
                HStack{
                    HStack{
                        if tasks.isEmpty {
                            
                            NavigationLink(destination: TaskView()){
                                Image("addtask")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 205, height: 79)
                                .clipped() // add a link to navigation here
                            }
                       
                        }
                        else { // picker
                                Picker("Tasks", selection: $dataModel.selectedTask) {
                                    ForEach(tasks, id: \.self) { task in
                                        Text(task.content).tag(task.id)
                                    }
                                }.pickerStyle(.menu)
                        }
                    }.padding()  .background(Color.tomato,in: Capsule()).foregroundColor(Color.accent)
                }.padding(.leading, 30).padding(.top,170)
                   
                
                ZStack{ // changes background based on the current mode
                    
                    switch newTimerModel.mode {
                    case .pom:
                        PomodoroView()
                    case .break1:
                        BreakOneView()
                    case .break2:
                       BreakTwoView()
                    }
                    Text(newTimerModel.formattedTime)
                    
                }.font(.system(size: 45, weight: .medium, design: .rounded))
                    .foregroundColor(Color.accent)
                    .padding(.leading, 30).padding(.top,30)
                
                HStack(){ // timer controls
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
                } .padding(.leading, 30)
                
                
            }
        }.background(Color(UIColor.background))
            .ignoresSafeArea()
    }
}

