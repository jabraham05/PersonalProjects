//
//  MainViewModel.swift
//  CalendarApp
//
//  Created by John Abraham on 9/14/23.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    @Published var isShowingEventAdder = false
    @Published var events: [Event] = []
    @Published var currentWeek: [Date] = []
    @Published var filteredEvents: [Event]?
    @Published var currentDay = Date()
    @Published var selectedWeek = 0
    
    private var dataController = DataController()
    private var switchedFrom = 0
    
    // MARK: Initalizing
    init() {
        fetchEvents()
        fetchCurrentWeek()
        filterTodayTasks()
    }
    
    // MARK: Checking if week went forward or backwards
    func weekAdded() -> Bool {
        if selectedWeek > switchedFrom {
            return true
        } else {
            return false
        }
        
        switchedFrom = selectedWeek
    }
    
    // MARK: Calendar Calculation
    func fetchCurrentWeek() {
        let calendar = Calendar.current
        
        let shiftedWeek = calendar.date(byAdding: .weekOfMonth, value: selectedWeek, to: currentDay)
        
        
        let week = calendar.dateInterval(of: .weekOfMonth, for: shiftedWeek!)
        
        
        
        guard let firstWeekDay = week?.start else { return }
        
        currentWeek = []
        
        for day in 1...7 {
            if let weekday = calendar.date(byAdding: .day, value: day, to: firstWeekDay) {
                currentWeek.append(weekday)
            }
        }
        
        currentDay = currentWeek[3]
    }
    
    // MARK: Filter Current Events
    func filterTodayTasks() {
        
        DispatchQueue.global(qos: .userInteractive).async {
            let calendar = Calendar.current
            
            let filtered = self.events.filter {
                return calendar.isDate($0.dueDate!, inSameDayAs: self.currentDay)
            }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.filteredEvents = filtered
                }
            }
        }
    }
    
    // MARK: Check if date is current date for header
    func isToday(date: Date) -> Bool {
        let calendar = Calendar.current
        
        return calendar.isDate(self.currentDay, inSameDayAs: date)
    }
    
    // MARK: Data Handling functions
    func fetchEvents() {
        events = dataController.fetchEvent()
        events = events.sorted(by: { $0.dueDate! < $1.dueDate! })
    }
    
    func deleteEvent(indexSet: IndexSet) {
        dataController.deleteEvent(events: events, indexSet: indexSet)
        fetchEvents()
    }
}
