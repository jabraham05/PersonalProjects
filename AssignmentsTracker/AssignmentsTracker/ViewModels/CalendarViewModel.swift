//
//  CalanderViewModel.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/12/23.
//

import Foundation

class CalendarViewModel: ObservableObject {
    @Published var selectedMonth = 0
    @Published var selectedDate = Date()
    @Published var daysOfTheWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    func fetchDates() -> [CalenderDate] {
        let calendar = Calendar.current
        
        let currentMonth = fetchSelectedMonth()
        
        var dates = currentMonth.daysOfTheMonth().map({CalenderDate(day: calendar.component(.day, from: $0), date: $0)})
        
        let firstDaysOfWeek = calendar.component(.weekday, from: dates.first?.date ?? Date())
        
        for _ in 0..<firstDaysOfWeek - 1 {
            dates.insert(CalenderDate(day: -1, date: Date()), at: 0)
        }
        return dates
        
        
    }
    
    func fetchSelectedMonth() -> Date {
        let calendar = Calendar.current
        
        let month = calendar.date(byAdding: .month, value: selectedMonth, to: Date())
        
        return month!
    }
}

struct CalenderDate: Identifiable {
    let id = UUID()
    let day: Int
    let date: Date
}
