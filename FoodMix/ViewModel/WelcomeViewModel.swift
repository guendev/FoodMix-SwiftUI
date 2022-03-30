//
//  WelcomeViewModel.swift
//  FoodMix
//
//  Created by Yuan on 25/02/2022.
//

import SwiftUI

class WelcomeViewModel: ObservableObject {
    @AppStorage("welcome") var welcome: Bool = true
    
    @Published var offset: CGFloat = .zero
    
    @Published var currentIndex: Int = .zero
    
    func skipWelcome() -> Void {
        withAnimation {
            welcome = false
        }
    }
    
    func toPage(index: Int) -> Void {
        
    }
}
