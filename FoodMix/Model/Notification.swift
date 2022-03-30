//
//  Notification.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

struct Notification: Identifiable, Codable {
    
    let id: String
    var user: User?
    var sender: User?
    var icon: String
    var title: String
    var content: String
    var createdAt: Float
    var readAt: Float?
    
}


