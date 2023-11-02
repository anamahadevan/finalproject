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
                Text("Dark Mode")
            }
        }.navigationTitle("Settings")
    }
}

#Preview {
    SettingsView()
}
