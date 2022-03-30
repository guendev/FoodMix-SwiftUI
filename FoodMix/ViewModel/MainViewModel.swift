//
//  MainViewModel.swift
//  FoodMix
//
//  Created by Yuan on 30/03/2022.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var currentTab: MainTab = .Home
    
    @Published var showMenu: Bool = false
    
}
