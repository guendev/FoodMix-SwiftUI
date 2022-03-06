//
//  PreviewWrapper.swift
//  FoodMix
//
//  Created by Yuan on 06/03/2022.
//

import SwiftUI

struct PreviewWrapper<Content: View>: View {
    
    // welcome -> mở app lần đầu
    @AppStorage("welcome") var welcome: Bool = true
    
    @StateObject private var viewModel: AppViewModel = AppViewModel()
    
    @State private var isActive: Bool = false
        
    let persistenceController = PersistenceController.shared
    let content: Content
            
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationView {
            content
                .introspectNavigationController { nav in
                    nav.navigationBar.isHidden = true
                }
                
        }
        .environmentObject(viewModel)
        .environment(\.managedObjectContext, persistenceController.container.viewContext)
        .environment(\.authKey, viewModel.auth)
        .environment(\.currentUserKey, viewModel.user)
    }
}
