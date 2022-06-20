//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by mac on 21.09.2021.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // Create an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        
    }
    
   static func getPortion(ingredient:Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
       var portion = " "
       var numerator = ingredient.num ?? 1
       var denominator = ingredient.denom ?? 1
       var wholePortions = 0
              
       if ingredient.num != nil {
           // Get a single serving size by multiplying denominator by the recipe serving
           denominator = denominator * recipeServings
           //denominator *= recipeServings
           // Get target portion by multiplying numerator by target servings
           numerator *= targetServings
           // Reduce fraction by greatest  common divisor
           let divisor = Rational.greatestCommonDivisor(numerator, denominator)
           numerator /= divisor
           denominator /= divisor
           
           // Get the whole portion if numerator > denominator
           if numerator >= denominator {
               //Calculate the whole portions
               wholePortions = numerator / denominator
               // Calculate the remainder
               numerator = numerator % denominator
               // Assign to portion string
               portion += String(wholePortions)
           }
           // Express the remainder as a fraction
           if numerator > 0 {
               
               // Assign raminder  as fraction to the portion string
               portion += wholePortions > 0 ? " " : ""
               portion += "\(numerator)/\(denominator)"
           }
       
          
       }
       if var unit = ingredient.unit {
        
        // Calculate appropriate suffix
           if wholePortions > 1 {
              
               if unit.suffix(2) == "ch" {
                   unit += "es"
               } else if unit.suffix(1) == "f" {
                   unit = String(unit.dropLast())
                   unit += "ves"
               } else {
                       unit += "s"
                   
               }
           }
           portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
           return portion + unit
       }
       return portion
    }
}
