//
//  finalprojectApp.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/24/23.
//

import SwiftUI

@main
struct finalprojectApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
        .modelContainer(for: Task.self)
    }
}
