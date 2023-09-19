//
//  DataController.swift
//  CalendarApp
//
//  Created by John Abraham on 9/13/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container: NSPersistentContainer
    
    
    init() {
        container = NSPersistentContainer(name: "Event")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Failed loading data: \(error.localizedDescription)")
            } else {
                print("Succefully loaded data")
            }
        }
    }
    
    func fetchEvent() -> [Event] {
        let request = NSFetchRequest<Event>(entityName: "Event")
        
        do {
            return try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching \(error)")
            return []
        }
    }
    
    func addEvent(title: String, course: String, dueDate: Date, red: Double, green: Double, blue: Double) {
        let newEvent = Event(context: container.viewContext)
        newEvent.title = title
        newEvent.course = course
        newEvent.dueDate = dueDate
        newEvent.red = red
        newEvent.green = green
        newEvent.blue = blue
        
        saveData()
        
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving \(error)")
        }
    }
    
    func deleteEvent(events: [Event], indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = events[index]
        container.viewContext.delete(entity)
        
        saveData()
    }
}
