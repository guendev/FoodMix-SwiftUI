//
//  ContentView.swift
//  Shared
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI
import Introspect

struct ContentView: View {
    
    @ObservedObject private var viewModel: AppViewModel = AppViewModel()
            
    var body: some View {
        
        NavigationView {
            MainView()
                .background(Color("Background").ignoresSafeArea())
                .introspectNavigationController { navi in
                    navi.navigationBar.isHidden = true
                }
        }
        .environmentObject(viewModel)
        .environment(\.authKey, viewModel.auth)
        .environment(\.currentUserKey, viewModel.user)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
