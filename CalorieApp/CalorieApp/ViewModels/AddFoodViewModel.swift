//
//  AddFoodViewModel.swift
//  CalorieApp
//
//  Created by John Abraham on 9/7/23.
//

import Foundation

class AddFoodViewModel: ObservableObject {
    @Published var foodName: String = ""
    @Published var calorieAte: Double = 0
    @Published var proteinAte: Double = 0
    @Published var carbAte: Double = 0
    @Published var fatAte: Double = 0
}
