//
//  CalendarView.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/12/23.
//

import SwiftUI

struct CalendarView: View {
    @StateObject var viewModel = CalendarViewModel()
    var sampleAssginment = Date()
    
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    viewModel.selectedMonth -= 1
                } label: {
                    Image(systemName: "chevron.left.2")
                }
                
                Text("\(viewModel.selectedDate.toMonthAndYear())")
                    .font(.title)
                
                Button {
                    viewModel.selectedMonth += 1
                } label: {
                    Image(systemName: "chevron.right.2")
                }
            }
            .padding(.bottom, 30)
            
            HStack(spacing: 30) {
                ForEach(viewModel.daysOfTheWeek, id: \.self) { days in
                    Text("\(days)")
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity)
                }
            }
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 7), spacing: 30) {
                ForEach(viewModel.fetchDates()) { value in
                    
                    if (value.day != -1) {
                        Text("\(value.day)")
                            .background {
                                ZStack {
                                    if value.date.toString() == Date().toString() {
                                        Circle()
                                            .frame(width: 32, height: 32)
                                            .foregroundColor(Color.blue)
                                    }
                                }
                            }
                    } else {
                        Text("")
                    }
                }
            }
            
            
            Spacer()
            
        }
        .padding()
        .onChange(of: viewModel.selectedMonth) { _ in
            viewModel.selectedDate = viewModel.fetchSelectedMonth()
        }
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
