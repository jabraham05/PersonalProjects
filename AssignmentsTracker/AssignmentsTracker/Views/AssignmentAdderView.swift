//
//  AssignmentAdderView.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/7/23.
//

import SwiftUI

struct AssignmentAdderView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AssignmentAdderViewModel()
    
    var body: some View {
        VStack {
            Text("Add Assignment")
            
            Form {
                TextField("Assignment Title", text: $viewModel.name)
                
                TextField("Course Name", text: $viewModel.course)
                
                VStack() {
                    Text("Due Date")
                        .foregroundColor(Color.black.opacity(0.5))
                    DatePicker("Due Date", selection: $viewModel.dueDate)
                        .datePickerStyle(.graphical)
                }
                HStack {
                    Spacer()
                    
                    Button {
                        DataController().addAssignment(name: viewModel.name,
                                                       course: viewModel.course,
                                                       dueDate: viewModel.dueDate, context: managedObjContext)
                        dismiss()
                        
                    } label: {
                        Text("Submit")
                    }
                    
                    Spacer()
                }
            }
            
            
            
        }
    }
}

struct AssignmentAdderView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentAdderView()
    }
}
