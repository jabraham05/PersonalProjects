//
//  Assignment+CoreDataProperties.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/11/23.
//
//

import Foundation
import CoreData


extension Assignment {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Assignment> {
        return NSFetchRequest<Assignment>(entityName: "Assignment")
    }

    @NSManaged public var name: String?
    @NSManaged public var course: String?
    @NSManaged public var dueDate: Date?
    @NSManaged public var id: UUID?

}

extension Assignment : Identifiable, Sequence {

}
