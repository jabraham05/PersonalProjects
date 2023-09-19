//
//  ContentView.swift
//  AssignmentsTracker
//
//  Created by John Abraham on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.dueDate)]) var assignments: FetchedResults<Assignment>
    @StateObject var viewModel = ContentViewModel()
    private var colorsDecoder: [Int:Color] = [0 : Color.blue, 1 : Color.red, 2 : Color.green, 3 : Color.cyan, 4 : Color.pink, 5 : Color.mint, 6 : Color.gray]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(assignments) {assignment in
                        NavigationLink(destination: AssignmentView(assignment: assignment)) {
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("\(assignment.name!)")
                                        .bold()
                                    
                                    Text("\(assignment.course!)")
                                        .foregroundColor(Color.gray)
                                        .italic()
                                }
                                
                                Spacer()
                                
                                Text(calcTimeUnitl(dueDate: assignment.dueDate!))
                            }
                            
                        }
                        .listRowBackground(colorsDecoder[viewModel.getClassColor(assignment: assignment)]?.opacity(0.2))
                    }
                    .onDelete(perform: deleteAssignment)
                                        
                }
                .listStyle(.plain)
            }
            .navigationTitle("Assignment's Todo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingAssignmentAdder.toggle()
                    } label: {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .sheet(isPresented: $viewModel.showingAssignmentAdder) {
                AssignmentAdderView()
            }
        }
    }
    
    // Delete Food
    func deleteAssignment(offsets: IndexSet) {
        withAnimation {
            offsets.map { assignments[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
