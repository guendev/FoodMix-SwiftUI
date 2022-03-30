//
//  StringExtension.swift
//  FoodMix
//
//  Created by Yuan on 25/02/2022.
//

import SwiftUI

extension String {
    
    public static let customFont = "Nutino"
    
    public static func formatTime(_ timestamp: Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .abbreviated
        let now = Date()
        return formatter.string(from: Date(timeIntervalSince1970: TimeInterval(timestamp) / 1000), to: now)!
    }
    
}
