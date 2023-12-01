//
//  finalprojectApp.swift
//  finalproject
//
//  Created by anabelle mahadevan on 10/24/23.
//

import SwiftUI
import SwiftData

@main
struct finalprojectApp: App {
    
    var container: ModelContainer
    @StateObject var dataModel: DataModel = DataModel()
        init() {
            do {
                container = try ModelContainer(for: Task.self, Topic.self)
            } catch(let error) {
                fatalError("Failed to configure SwiftData container. \(error)")
            }
        }
    
    var body: some Scene {
        WindowGroup {
            HomeView().environmentObject(dataModel)
        }
        .modelContainer(container)
    }
}
