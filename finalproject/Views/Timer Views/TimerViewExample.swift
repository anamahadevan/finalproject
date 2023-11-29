////
////  TimerViewExample.swift
////  finalproject
////
////  Created by anabelle mahadevan on 11/29/23.
////
//
//import SwiftUI
//
//
//struct TimerViewExample: View {
//
//    @State var allTodos: [Todo]
//
//    @StateObject var newTimerModel = NewTimerModel()
//
//   
//    var body: some View {
//        VStack{
//            Text(newTimerModel.formattedTime)
//            
////            Text(newTimerModel.mode.rawValue)
////            
////            Picker("Topic: ", selection: $newTimerModel.todo) {
////                ForEach(allTodos, id: \.self) {
////                    Text($0.name)
////                }
////            }
////            Text("Times ran for this todo: \(newTimerModel.todo.timesRun.description)")
//        }
//    }
//    
//}
//
//#Preview {
//    TimerViewExample( allTodos: [Todo(name: nil), Todo(name: "Item 1")])
//}
//
//
//
//
//
//
