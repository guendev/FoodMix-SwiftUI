//
//  HomeSearch.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HomeSearch: View {
    var body: some View {
        NavigationLink(destination: SearchView()) {
            TextField("Tìm kiếm...", text: .constant(""))
                .multilineTextAlignment(.leading)
                .primaryInput(icons: [.leading], radius: 20)
                .overlay(
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color("TextContent"))
                        .padding()
                    
                    ,alignment: .leading
                    
                )
                .disabled(true)
        }
    }
}

struct HomeSearch_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            HomeView()
            
        }
    }
}
