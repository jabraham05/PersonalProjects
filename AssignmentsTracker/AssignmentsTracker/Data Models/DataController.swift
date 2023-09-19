//
//  DataController.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/7/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Assignment")
    
    init() {
        container.loadPersistentStores {desc, error in
            print("Failed to load the data \(error?.localizedDescription)")
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data has been saved")
        } catch {
            print("Data could not be saved")
        }
    }
    
    func addAssignment(name: String, course: String, dueDate: Date, context: NSManagedObjectContext) {
        let assignment = Assignment(context: context)
        assignment.id = UUID()
        assignment.name = name
        assignment.course = course
        assignment.dueDate = dueDate
        
        save(context: context)
    }
    
    func editAssignment(assignment: Assignment, name: String, course: String, dueDate: Date, context: NSManagedObjectContext) {
        assignment.name = name
        assignment.course = course
        assignment.dueDate = dueDate
        
        save(context: context)
    }
}
