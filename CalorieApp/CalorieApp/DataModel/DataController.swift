//
//  DataController.swift
//  CalorieApp
//
//  Created by John Abraham on 9/7/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do {
            try context.save()
            print("Data saved")
        } catch {
            print("Data was not saved")
        }
    }
    
    func addFood(name: String, calorie: Double, protien: Double, carb: Double, fat: Double, context: NSManagedObjectContext) {
        let food = Food(context: context)
        food.id = UUID()
        food.date = Date()
        food.name = name
        food.calorie = calorie
        food.protein = protien
        food.carb = carb
        food.fat = fat
        
        save(context: context)
    }
    
    func editFood(food: Food, name: String, calorie: Double, protien: Double, carb: Double, fat: Double, context: NSManagedObjectContext) {
        food.date = Date()
        food.name = name
        food.calorie = calorie
        food.protein = protien
        food.carb = carb
        food.fat = fat
        
        save(context: context)
    }
}
