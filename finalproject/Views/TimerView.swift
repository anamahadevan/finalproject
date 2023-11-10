//
//  TimerView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI

struct TimerView: View {
    var body: some View {
        GeometryReader { geometry in
            Text("Timer App will be here soon...")
        }
        .background(Color(UIColor.background)
            .ignoresSafeArea())     }
}

#Preview {
    TimerView()
}
