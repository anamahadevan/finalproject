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
                Section(header: Text("Timer settings")){PomodoroTime()}
                    
            }.foregroundColor(.brown)
            .tint(.pink)
            .background(Color.background)
            .scrollContentBackground(.hidden)
            .navigationBarTitle("Settings")
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


#Preview {
    SettingsView()
}
