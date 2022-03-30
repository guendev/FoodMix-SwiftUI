//
//  Province.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI

struct Province: Identifiable, Codable {
    var id = UUID().uuidString
    var name: String
    var type: String
    var name_with_type: String
    var code: String
    
    enum CodingKeys : String, CodingKey { case name, type, name_with_type, code }
}
