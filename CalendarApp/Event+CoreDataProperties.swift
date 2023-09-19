//
//  Event+CoreDataProperties.swift
//  CalendarApp
//
//  Created by John Abraham on 9/14/23.
//
//

import Foundation
import CoreData


extension Event {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Event> {
        return NSFetchRequest<Event>(entityName: "Event")
    }

    @NSManaged public var blue: Double
    @NSManaged public var course: String?
    @NSManaged public var green: Double
    @NSManaged public var id: UUID?
    @NSManaged public var notes: String?
    @NSManaged public var red: Double
    @NSManaged public var dueDate: Date?
    @NSManaged public var title: String?

}

extension Event : Identifiable {

}
