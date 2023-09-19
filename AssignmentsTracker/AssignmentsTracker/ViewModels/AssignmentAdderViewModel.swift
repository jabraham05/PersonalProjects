//
//  AssignmentAdderViewModel.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/7/23.
//

import Foundation

class AssignmentAdderViewModel: ObservableObject {
    @Published var name = ""
    @Published var course = ""
    @Published var dueDate = Date()
    
}
