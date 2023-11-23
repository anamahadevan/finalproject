//
//  ProgressView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/26/23.
//

import SwiftUI

struct ProgressView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Spacer()
                Text("Progress")
                    .font(Font.custom("MacSans-Regular", size: 18))
                Spacer()
            }
        }
        .background(Color(UIColor.background)
            .ignoresSafeArea())     }
}

#Preview {
    ProgressView()
}
