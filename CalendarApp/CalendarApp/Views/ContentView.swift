//
//  ContentView.swift
//  CalendarApp
//
//  Created by John Abraham on 9/13/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Title", text: $viewModel.title)
                
                TextField("course", text: $viewModel.course)
                
                ColorPicker("Course Color", selection: $viewModel.color)
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                
                Button {
                    viewModel.addEvent(title: viewModel.title, course: viewModel.course, dueDate: viewModel.dueDate, red: Double(viewModel.color.components.red), green: Double(viewModel.color.components.green), blue: Double(viewModel.color.components.blue))
                    dismiss()
                    
                } label: {
                    Text("Submit")
                }
            }
            .navigationTitle("Add Event")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
