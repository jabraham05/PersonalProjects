//
//  AssignmentViewModel.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/11/23.
//

import Foundation

class AssignmentViewModel: ObservableObject {
    @Published var assignment: Assignment
    
    init(assignment: Assignment) {
        self.assignment = assignment
    }
}
