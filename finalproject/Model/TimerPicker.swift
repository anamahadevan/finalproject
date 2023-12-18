//
//  RangePicker.swift
//  pomcat timer
//
//  Created by anabelle mahadevan on 12/15/23.
//

import SwiftUI
struct TimerPicker: View {
    @Binding var selected: Int
    let min: Int
    let max: Int
    var body: some View {
        ZStack{
            HStack{
                Picker("", selection: $selected) {
                    ForEach(min ..< max, id: \.self) {
                        Text(String(format: "%02d", $0))
                    }
                }
                .frame( height: 90).pickerStyle(.wheel)  
            }
        }.background(Color.accent)
//            .scaleEffect(CGSize(width: 1, height: 1))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}

#Preview {
    SettingsView()
}




