//
//  Ingredient.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import Foundation

struct IngredientItem: Identifiable {
    var id = UUID().uuidString
    let name: String
    let image: String
    let content: String
    let properties: [String]
}
