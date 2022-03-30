//
//  FoodMixApp.swift
//  FoodMix
//
//  Created by Yuan on 06/03/2022.
//

import SwiftUI
import Firebase


@main
struct FoodMixApp: App {
    let persistenceController = PersistenceController.shared
    
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
