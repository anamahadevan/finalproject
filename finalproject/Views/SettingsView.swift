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
        }
    }
}

class SelectedTime: Equatable {
    static func == (lhs: SelectedTime, rhs: SelectedTime) -> Bool {
        return false
    }
    
    var min: Int = 0
    var sec: Int = 0
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}

struct PomodoroTime: View {
    @EnvironmentObject var model: DataModel
    @State private var time: SelectedTime = .init()
    
    var body: some View {
        VStack {
            Text("pomodoro time")
            HStack {
                RangePicker(selected: $time.min, min: 0, max: 31)
                RangePicker(selected: $time.sec, min: 0, max: 61)
            }
        }
        .onChange(of: time) { _, new in
            UserDefaults.standard.setValue(new.min*60+new.sec, forKey: "pom")
        }
        .onAppear() {
            print( UserDefaults.standard.integer(forKey: "pom"))
        }
    }
}

struct BreakOneTimer: View {
    @EnvironmentObject var model: DataModel
    @State private var time: SelectedTime = .init()
    
    var body: some View {
        VStack {
            Text("break 1")
            HStack {
                RangePicker(selected: $time.min, min: 0, max: 31)
                RangePicker(selected: $time.sec, min: 0, max: 61)
            }
        }
        .onChange(of: time) { _, new in
            UserDefaults.standard.setValue(new.min*60+new.sec, forKey: "break1")
        }
    }
}

struct BreakTwoTimer: View {
    @EnvironmentObject var model: DataModel
    @State private var time: SelectedTime = .init()
    
    var body: some View {
        VStack {
            Text("break 2")
            HStack {
                RangePicker(selected: $time.min, min: 0, max: 31)
                RangePicker(selected: $time.sec, min: 0, max: 61)
            }
        }
        .onChange(of: time) { _, new in
            UserDefaults.standard.setValue(new.min*60+new.sec, forKey: "break2")
        }
    }
}

#Preview {
    SettingsView()
}
