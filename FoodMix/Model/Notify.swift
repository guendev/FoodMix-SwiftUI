//
//  Notify.swift
//  FoodMix
//
//  Created by Yuan on 07/03/2022.
//

import SwiftUI

struct Notify: Identifiable, Codable {
    var id = UUID().uuidString
    var user: User
    var msg: String
    var error: Bool?
    
    enum CodingKeys : String, CodingKey { case user, msg, error }
    
    func success() -> Bool {
        return error == nil || !error!
    }
    
}
