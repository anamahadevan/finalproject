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
//                            Image( "calico").resizable()
//                            .frame(width: 125, height: 130)
                            
                        ProgressWheel(type: .topicOne).frame(width: 120, height: 112)
                            .offset( y: 75)
                    }
                    
                    
                    Spacer()
                    
                    // circle background here
                    ProgressWheel(type: .topicFour)
                        .frame(width: 110, height: 108)
                        .offset( x: -15, y: 0)
                    
                }.padding(.vertical, 20.0)
                
                
                
                
                HStack{
                    Image("progresscat")
                        .resizable()
                        .frame(width: 296, height: 283)
                }
                .padding(.vertical, 80.0)
                
                
                
                HStack{
                    // HSTACK here with offset
                    
                    
                    ProgressWheel(type: .topicTwo)
                        .frame(width: 110, height: 108)
                        .offset( x: 20, y: -55)
                    
                    Spacer()
                    
                    
                    ProgressWheel(type: .topicThree)
                        .frame(width: 110, height: 108)
                        .offset( x: 20, y: 25)
                    
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
                .foregroundColor(.accent)
                .font(.largeTitle)
              
            
            //title lf topic
            Text(type.rawValue).padding().background(Color.accent,in: Capsule())
                .foregroundColor(.brown)
        }
    }
}




#Preview {
    ProgressPageView()
}
