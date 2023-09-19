//
//  Extensions.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/11/23.
//

import Foundation
import SwiftUI

extension Binding {
     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
    }
}

extension Date {
    func toString() -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MM/dd/yyyy"
        
        return formatter.string(from: self)
    }
    
    
    func toMonthAndYear() -> String {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMMM YYYY"
        
        return formatter.string(from: self)
    }
    
    func daysOfTheMonth() -> [Date] {
        let calendar = Calendar.current
        let currentMonth = calendar.component(.month, from: self)
        let currentYear = calendar.component(.year, from: self)
        
        var startDateComp = DateComponents()
        startDateComp.month = currentMonth
        startDateComp.day = 1
        let startDate = calendar.date(from: startDateComp)!
        
        var endDateComp = DateComponents()
        endDateComp.month = 1
        endDateComp.day = -1
        let endDate = calendar.date(byAdding: endDateComp, to: startDate)!
        
        var dates: [Date] = []
        var currentDate = startDate
        
        while currentDate <= endDate {
            dates.append(currentDate)
            currentDate = calendar.date(byAdding: .day, value: 1, to: currentDate)!
        }
        
        return dates
    }
}
