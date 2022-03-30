//
//  BoardingScreen.swift
//  FoodMix
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI

struct BoardingScreen: Identifiable {
    var id = UUID().uuidString
    var image: String
    var title: String
    var description: String
    var color: Color
}

// Same Title and desc...
let title = "Easy Payments with \nWalletory"
let description = "Small business can receive device \npayment super fast and super easy"

// Since image name and BG color name are same....
// Sample Model SCreens....
var boardingScreens: [BoardingScreen] = [

    BoardingScreen(image: "cute2", title: title, description: description, color: Color("Screen1")),
    BoardingScreen(image: "cute1", title: title, description: description, color: Color("Screen2")),
    BoardingScreen(image: "cute3", title: title, description: description, color: Color("Screen3")),
]
