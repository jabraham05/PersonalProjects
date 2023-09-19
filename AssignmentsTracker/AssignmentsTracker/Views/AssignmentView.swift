//
//  Assignment View.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/11/23.
//

import SwiftUI

struct AssignmentView: View {
    @State var assignment: Assignment

    var body: some View {
        NavigationView {
            VStack {
                DatePicker("Due Date", selection: $assignment.dueDate.toUnwrapped(defaultValue: Date()))
                    .datePickerStyle(.graphical)
                    .padding(10)
            }
        }
        .navigationTitle("\(assignment.name!)")
    }
}

struct HeaderView: View {
    var title: String
    var course: String
    
    var body: some View {
        VStack {
            Text("\(title)")
                .font(.largeTitle)
                .bold()
            
            Text("\(course)")
                .font(.callout)
        }
    }
}
struct AssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentView(assignment: Assignment())
    }
}
