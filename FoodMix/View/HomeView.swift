//
//  HomeView.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        
        VStack {
            
            HelloView()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    Text("Khám phá ngay")
                        .font(.custom(.customFont, size: 22))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextContent"))
                        .padding(.top, 16)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HomeSearch()
                    
                    HomeCategories()
                    
                    HomeIngredient()
                    
                    HomeUpdatedView()
                    
                }
                .padding(.bottom, 100)
                
            }
            
        }
        .environmentObject(viewModel)
        .padding(.horizontal, 25)
        .background(Color("Background").ignoresSafeArea())

        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            MainView()
            
        }
    }
}
