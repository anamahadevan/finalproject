//
//  PomodoroView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/27/23.
//

import SwiftUI

//    .background(Image("tomato").resizable().frame(width: 327, height: 325))

struct PomodoroView: View {
    var body: some View {
        VStack{
            Image("tomato").resizable().frame(width: 327, height: 325)
            Text("Pomodoro Mode").foregroundColor(Color.accent).font(.system(size: 14, weight: .medium, design: .rounded)).offset(y:-20)
        }
    }
}

struct BreakOneView: View {
    var body: some View {
        VStack{
            Image("tbreak1").resizable().frame(width: 327, height: 325)
            Text("Break #1").foregroundColor(Color.accent).font(.system(size: 14, weight: .medium, design: .rounded)).offset(y:-20)
        }
    }
}

struct BreakTwoView: View {
    var body: some View {
        VStack{
            Image("tbreak2").resizable().frame(width: 327, height: 325)
            Text("Break #2").foregroundColor(Color.accent).font(.system(size: 14, weight: .medium, design: .rounded)).offset(y:-20)
        }
    }
}




#Preview {
    TimerView()
}
