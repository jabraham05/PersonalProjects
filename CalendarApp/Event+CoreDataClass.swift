//
//  Event+CoreDataClass.swift
//  CalendarApp
//
//  Created by John Abraham on 9/14/23.
//
//

import Foundation
import CoreData
import SwiftUI

@objc(Event)
public class Event: NSManagedObject {
    func getColor() -> Color {
        return Color(red: self.red, green: self.green, blue: self.blue)
    }
}
