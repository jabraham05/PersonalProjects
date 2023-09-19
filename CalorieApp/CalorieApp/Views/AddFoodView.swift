//
//  AddFoodView.swift
//  CalorieApp
//
//  Created by John Abraham on 9/7/23.
//

import SwiftUI

struct AddFoodView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = AddFoodViewModel()
    
    var body: some View {
        VStack {
            Text("Add Food")
            
            Spacer()
            
            Form {
                TextField("Food", text: $viewModel.foodName)
                
                VStack {
                    Text("Calories: \(Int(viewModel.calorieAte))")
                    Slider(value: $viewModel.calorieAte, in: 0...1000, step: 10)
                    Text("Protein: \(Int(viewModel.proteinAte))")
                    Slider(value: $viewModel.proteinAte, in: 0...500, step: 1)
                    Text("Carb: \(Int(viewModel.carbAte))")
                    Slider(value: $viewModel.carbAte, in: 0...500, step: 1)
                    Text("Fat: \(Int(viewModel.fatAte))")
                    Slider(value: $viewModel.fatAte, in: 0...500, step: 1)

                }
                
                HStack {
                    Spacer()
                    Button {
                        DataController().addFood(name: viewModel.foodName, calorie: viewModel.calorieAte, protien: viewModel.proteinAte, carb: viewModel.carbAte, fat: viewModel.fatAte, context: managedObjContext)
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

struct AddFoodView_Previews: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
