//
//  TestView.swift
//  finalproject
//
//  Created by anabelle mahadevan on 11/30/23.
//

import SwiftUI

struct TestView: View {
    @EnvironmentObject var dataModel: DataModel
    var body: some View {
        Text(dataModel.selectedTask.content.description)
    }
}

#Preview {
    TestView()
}
