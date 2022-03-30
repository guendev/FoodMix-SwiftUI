//
//  Recipe.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI
import Apollo

struct Recipe: Identifiable, Codable {
    let id: String
    var name: String
    var slug: String
    var avatar: String
    var content: String?
    var category: Category?
    var user: User?
    
    var ingredients: [Ingredient]?
    var stepper: [Stepper]?
    
    var time: String?
    var preparation: String?
    
    var countRating: Int?
    var totalRating: Int?
    var views: Int?
    
    var createdAt: Float?
    
    func rating() -> Double {
        
        if countRating == nil || totalRating == nil || countRating == 0 || totalRating == 0 {
            return 0.0
        }
        
        let doubleValue = Double(totalRating!) / Double(countRating! * 5)
        
        return doubleValue.round(to: 1)
        
    }
}

struct Stepper: Identifiable, Codable {
    var id = UUID().uuidString
    let name: String
    let content: String
    let image: String?
    
    enum CodingKeys : String, CodingKey { case name, content, image }
}


struct Ingredient: Codable, Identifiable {
    var id = UUID().uuidString
    let name: String
    let count: Int
    let unit: String
    
    enum CodingKeys : String, CodingKey { case name, count, unit }
}
