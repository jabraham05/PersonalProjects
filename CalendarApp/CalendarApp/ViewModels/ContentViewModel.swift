//
//  ContentViewModel.swift
//  CalendarApp
//
//  Created by John Abraham on 9/14/23.
//

import Foundation
import SwiftUI


class ContentViewModel: ObservableObject {
    @Published var color = Color(.sRGB, red: 0, green: 0, blue: 0)
    @Published var title = ""
    @Published var course = ""
    @Published var dueDate = Date()
    @Published var events: [Event] = []

    private let dataController = DataController()
    
    
    func addEvent(title: String, course: String, dueDate: Date, red: Double, green: Double, blue: Double) {
        dataController.addEvent(title: title,
                                course: course, dueDate: dueDate, red: red, green: green, blue: blue)
    }
    

}
