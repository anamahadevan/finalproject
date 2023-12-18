//
//  RangePicker.swift
//  pomcat timer
//
//  Created by anabelle mahadevan on 12/15/23.
//

import SwiftUI
struct RangePicker: View {
    @Binding var selected: Int
    let min: Int
    let max: Int
    var body: some View {
        HStack{
            Picker("", selection: $selected) {
                ForEach(min ..< max, id: \.self) {
                    Text(String(format: "%02d", $0))
                }
            }
        }.background(Color.background)
            .padding()
            .pickerStyle(.wheel)
            .labelsHidden()
            .frame(width: 80, height: 140)
            .scaleEffect(CGSize(width: 1, height: 1))
            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
    }
}




