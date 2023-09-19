//
//  AssignmentsTrackerApp.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/7/23.
//

import SwiftUI

@main
struct AssignmentsTrackerApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
