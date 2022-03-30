//
//  FilterItem.swift
//  FoodMix
//
//  Created by Yuan on 08/03/2022.
//

import SwiftUI

class FilterItem: Identifiable {
    var id = UUID().uuidString
    let name: String
    let value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
    
}
