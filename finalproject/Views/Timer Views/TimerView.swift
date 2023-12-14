
import SwiftUI
import SwiftData

struct TimerView: View {
    
    // import tasks
    @Environment(\.modelContext) private var modelContext
    
    // set initial mode to be pomodoro
    @State var currentMode: TimerMode = .pom
    
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
                }.padding(.leading, 30).padding(.top,170)
                
                ZStack{ // changes background based on the current mode
                    
                    switch currentMode {
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
//                    .background(Image("tomato").resizable().frame(width: 327, height: 325))
                    .padding(.leading, 30).padding(.top,30)
                
                HStack(spacing: 50){ // timer controls
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
                
            }
        }.background(Color(UIColor.background))
            .ignoresSafeArea()
    }
}

