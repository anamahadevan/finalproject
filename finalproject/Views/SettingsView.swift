//
//  SettingsView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var dataModel: DataModel
    var body: some View {
        VStack{
            Form {
                Image("settingstitle")
                    .resizable()
                    .frame(width: 340, height: 100)
                    .listRowBackground(Color.background)
                
                Section(header: Image("timersettings").foregroundColor(.white)){
                    PomodoroTime()
                    Image("border")
                        .resizable()
                        .frame(width: 340, height: 100)
                    BreakOneTimer()
                    Image("border")
                        .resizable()
                        .frame(width: 340, height: 100)
                    BreakTwoTimer()
                }.listRowBackground(Color.accent)
                    
            }.foregroundColor(.brown)
            .tint(.pink)
            .background(Color.background)
            .scrollContentBackground(.hidden)
        }.onDisappear{
            dataModel.saveTimerSettings()
        }
    }
}

struct PomodoroTime: View {
    @EnvironmentObject var model: DataModel
    @State private var date = Date()
    
    var body: some View {
        DatePicker("Pomodoro timer ", selection: $model.timer1, displayedComponents: [.hourAndMinute])
            .padding()
    }
}

struct BreakOneTimer: View {
    @State private var date = Date()
    @EnvironmentObject var model: DataModel
    var body: some View {
        DatePicker("Break 1 timer ", selection: $model.timer2, displayedComponents: [.hourAndMinute])
            .padding()
     
    }
}

struct BreakTwoTimer: View {
    @State private var date = Date()
    @EnvironmentObject var model: DataModel
    var body: some View {
        DatePicker("Break 2 timer ", selection: $model.timer3, displayedComponents: [.hourAndMinute])
            .padding()
    }
}

#Preview {
    SettingsView()
}
