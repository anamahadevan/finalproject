//
//  SettingsView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI

struct SettingsView: View {
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
        }
    }
}

struct PomodoroTime: View {
    @State private var date = Date()
    
    var body: some View {
        DatePicker("Pomodoro timer ", selection: $date, displayedComponents: [.hourAndMinute])
            .padding()
    }
}

struct BreakOneTimer: View {
    @State private var date = Date()
    
    var body: some View {
        DatePicker("Break one timer ", selection: $date, displayedComponents: [.hourAndMinute])
            .padding()
    }
}

struct BreakTwoTimer: View {
    @State private var date = Date()
    
    var body: some View {
        DatePicker("Break two timer ", selection: $date, displayedComponents: [.hourAndMinute])
            .padding()
    }
}

#Preview {
    SettingsView()
}
