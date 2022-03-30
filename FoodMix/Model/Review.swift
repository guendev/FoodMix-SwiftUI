//
//  Review.swift
//  FoodMix
//
//  Created by Yuan on 05/03/2022.
//

import SwiftUI

struct Review: Identifiable, Codable {
    
    var id: String
    var user: User?
    var recipe: Recipe?
    var content: String
    var totalRating: Int
    var createdAt: Double
    
}
