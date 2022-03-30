//
//  Category.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct Category: Identifiable, Codable {
    
    let id: String
    let name: String
    let slug: String
    var avatar: String?
    var content: String?
    var icon: String?
    
}
