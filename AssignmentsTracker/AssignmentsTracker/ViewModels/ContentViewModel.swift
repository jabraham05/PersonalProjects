//
//  ContextViewModel.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/7/23.
//

import Foundation
import SwiftUI

class ContentViewModel: ObservableObject {
    @Published var showingAssignmentAdder = false
    private var courses: Set = Set<String>()
    
    private var colors:[String: Int] = [:]
    private var colorCounter = 0
    
    func getClassColor(assignment: Assignment) -> Int{
        updateCourseList(assignment: assignment)
        
        return colors[assignment.course!] ?? -1
    }
    
    func updateCourseList(assignment: Assignment) {
        if !courses.contains(assignment.course!) {
            courses.insert(assignment.course!)
            colors[assignment.course!] = colorCounter
            colorCounter += 1
        }
    }

}
