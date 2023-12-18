//
//  ProgressView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI
import SwiftData

struct ProgressPageView: View {
    //    @Environment(\.modelContext) private var modelContext
    //    @Query private var tasks: [Task]
    @Environment(\.modelContext) private var modelContext
    
    
    // The task will hold a topic name associated with the topic in swiftdata
    @Query var tasks: [Task]
    
    // Each topic will hold a name and a counter
    @Query var topics: [Topic]
    
    // @EnvironmentObject var dataModel: DataModel
    // create view model for opening screen
    var body: some View {
        GeometryReader { geometry in
            VStack{
                
                HStack{
                
                    
                    ZStack{
                            Image( "win").resizable()
                            .frame(width: 115, height: 100)
                            
                        ProgressWheel(type: .topicOne).frame(width: 120, height: 112)
                            .offset( y: 55)
                    }     .offset( x: 20, y: -9)
                    
                    
                    Spacer()
                    
                    ZStack{
                            Image( "siam").resizable()
                            .frame(width: 115, height: 100)
                            
                        ProgressWheel(type: .topicFour)
                            .frame(width: 110, height: 108)
                            .offset( y: 55)
                    }.offset(  x: -20, y: 39)
                   
                    
                }.padding(.vertical, 20.0)
                
                
                
                
                HStack{
                    Image("progresscat")
                        .resizable()
                        .frame(width: 296, height: 283)
                }
                .padding(.vertical, 80.0)
                
                
                
                HStack{
                    
                    ZStack{
                            Image( "calico").resizable()
                            .frame(width: 115, height: 100)
                            
                        ProgressWheel(type: .topicTwo).frame(width: 120, height: 112)
                            .offset( y: 55)
                    }     .offset( x: 20, y: -29)
                    
                    
                    Spacer()
                    
                    
                    ZStack{
                            Image( "bmo").resizable()
                            .frame(width: 115, height: 100)
                            
                        ProgressWheel(type: .topicThree)
                            .frame(width: 110, height: 108)
                            .offset( y: 55)
                    }.offset(  x: 20, y: -59)
                    
                } .padding([.bottom, .trailing], 30)
                
            }
            .padding(.horizontal, 10.0)
            
        }
        .background(Color(UIColor.background)
            .ignoresSafeArea())
    }
}


struct ProgressWheel: View {
    
    // sets up progress cap to ten
    let type: TopicType
    @State var count: Double = 0
    var body: some View {
        VStack{
            
            //displays number of tasks completed
            Text(String(count))
                .foregroundColor(.brown)
                .font(.largeTitle)
              
            
            //title lf topic
            NavigationLink(destination: TaskView()){
                Text(type.rawValue).padding().background(Color.accent,in: Capsule())
                    .foregroundColor(.brown)
            }
        }
    }
}




#Preview {
    ProgressPageView()
}
