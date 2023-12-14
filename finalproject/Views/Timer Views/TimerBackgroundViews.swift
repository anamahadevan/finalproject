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
        Image("tomato").resizable().frame(width: 327, height: 325)
        Text("help")
    }
}

struct BreakOneView: View {
    var body: some View {
        Image("tbreak1").resizable().frame(width: 327, height: 325)
    }
}

struct BreakTwoView: View {
    var body: some View {
//        Image("tbreak2").resizable().frame(width: 327, height: 325)
        Text("break 2")
    }
}




#Preview {
    PomodoroView()
}
