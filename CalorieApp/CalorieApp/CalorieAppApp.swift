//
//  CalorieAppApp.swift
//  CalorieApp
//
//  Created by John Abraham on 9/6/23.
//

import SwiftUI

@main
struct CalorieAppApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
