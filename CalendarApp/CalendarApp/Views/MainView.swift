//
//  MainView.swift
//  CalendarApp
//
//  Created by John Abraham on 9/14/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        NavigationView {
            VStack {
                
                HStack {
                    
                    Button {
                        withAnimation {
                            viewModel.selectedWeek -= 1
                            viewModel.fetchCurrentWeek()
                        }
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                    
                    ForEach(viewModel.currentWeek, id:\.self) {day in
                        VStack {
                            Text("\(day.string(format: "EEE"))")
                                .padding(.vertical, 10)
                            Text("\(day.string(format: "dd"))")
                        }
                        .foregroundStyle(viewModel.isToday(date: day) ? .primary : .secondary)
                        .foregroundColor(viewModel.isToday(date: day) ? .white : .black)
                        .frame(width: 42, height: 90)
                        .background {
                            ZStack {
                                if viewModel.isToday(date: day) {
                                    Capsule()
                                        .fill(.black)
                                }
                            }
                        }
                        .contentShape(Capsule())
                        .onTapGesture {
                            withAnimation() {
                                viewModel.currentDay = day
                            }
                        }
                    }
                    .padding(.vertical, 20)
                    .transition(.push(from: viewModel.weekAdded() ? .trailing : .leading))
                    
                    Button {
                        withAnimation {
                            viewModel.selectedWeek += 1
                            viewModel.fetchCurrentWeek()
                        }
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                    
                }
                
                
                ScrollView {
                    if let events = viewModel.filteredEvents {
                        if events.isEmpty {
                            Text("No Events Found")
                        } else {
                            ForEach(events, id: \.self) {event in
                                AssignmentCard(event: event)
                            }
                            
                        }
                    } else {
                        Text("Loading Results")
                    }
                } .onChange(of: viewModel.currentDay) {newValue in
                    viewModel.filterTodayTasks()
                }
                
                Spacer()
            }
            .onChange(of: viewModel.isShowingEventAdder) {value in
                guard !value else { return }
                viewModel.fetchEvents()
                viewModel.filterTodayTasks()
            }
            
            
            .toolbar {
                ToolbarItem {
                    Button {
                        viewModel.isShowingEventAdder.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShowingEventAdder) {
                ContentView()
            }
            
        }
    }
}


struct AssignmentCard: View {
    var event: Event
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(event.title!)")
                    .font(.system(size: 28, weight: .bold))
                    .padding(.bottom, 5)
                
                Text("\(event.course!) ")
            }
            
            Spacer()
            
            
            VStack {
                Text("\(event.dueDate!.string(format: "HH:mm"))")
                    .font(.callout)
                Spacer()
            }
        }
        .padding(20)
        .background(event.getColor().opacity(0.2))
        .shadow(radius: 10)
        .cornerRadius(10)
        .padding(.horizontal, 20)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
