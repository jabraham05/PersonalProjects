//
//  calcTimeUntil.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/7/23.
//

import Foundation

func calcTimeUnitl(dueDate: Date) -> String {
    let minutes = Int((dueDate.timeIntervalSinceReferenceDate/60 - Date().timeIntervalSinceReferenceDate/60))
    let hours = minutes/60
    let days = hours/24
    let weeks = days/7
    
    if minutes < 0 {
        return "Past due"
    } else if minutes == 0 {
        return "Due right now"
    } else if minutes < 60 {
        return "\(minutes) minutes until due"
    } else if hours < 24 {
        return "\(hours) hours until due"
    } else if days < 7 {
        return "\(days) days until due"
    } else {
        return "\(weeks) weeks until due"
    }
}
