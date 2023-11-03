//
//  SettingsView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            Form{
                
                Section(header: Text("Basic settings")){
                    Toggle(isOn: .constant(true), label: {
                        Text("Notifications")
                    })
                }
                
                Section(header: Text("Timer settings")){
                    PomodoroTime()
                    
                }
            }
        }.navigationTitle("Settings")
    }
}


struct PomodoroTime: View {
    @State private var date = Date()
    
    var body: some View {
        DatePicker("Pomodoro timer ", selection: $date, displayedComponents: [.hourAndMinute])
            .padding()
    }
}

#Preview {
    SettingsView()
}
