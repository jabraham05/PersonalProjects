//
//  ContentView.swift
//  CalorieApp
//
//  Created by John Abraham on 9/6/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var food: FetchedResults<Food>
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Int(totalCaloriesToday())) kcal Today")
                    .padding()
                
                List {
                    ForEach(food) {food in
                        NavigationLink(destination: Text("Fix")) {
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("\(food.name!)")
                                        .bold()
                                    
                                    Text("\(Int(food.calorie))") + Text(" calories").foregroundColor(Color.red)
                                }
                                
                                Spacer()
                                
                                Text(calcTimeFromNow(date: food.date!))
                                    .foregroundColor(Color.gray)
                                    .italic()
                            }
                        }
                    }
                    .onDelete(perform: deleteFood)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Calorie Tracker")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingMealAdder.toggle()
                    } label: {
                        Label("Add Food", systemImage: "plus.circle")
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
            .sheet(isPresented: $viewModel.showingMealAdder) {
                AddFoodView()
            }
        }
    }
    
    func deleteFood(offsets: IndexSet) {
        withAnimation {
            offsets.map { food[$0] }.forEach(managedObjContext.delete)
            
            DataController().save(context: managedObjContext)
        }
    }
    
    func totalCaloriesToday() -> Double{
        var calorieToday = 0.0
        for item in food {
            if Calendar.current.isDateInToday(item.date!) {
                calorieToday += item.calorie
            }
        }
        
        return calorieToday
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
