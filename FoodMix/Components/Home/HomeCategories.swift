//
//  HomeCategories.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HomeCategories: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    @Namespace var animation
    
    @State var showSheet: Bool = false
    
    @State var ready: Bool = false
    
    
    var body: some View {
        
        Group {
            
            HomeCategoriesList()
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                ZStack {
                    
                    if viewModel.loadingRecipesByCategory {
                        
                        RecipesPlaceholder()
                        
                    } else if viewModel.emtyRecipesByCategory {
                        
                        RecipesPlaceholder()
                        
                    } else {
                        
                        RecipesList()
                        
                    }
                    
                }
                .transition(.slide)
                
            }
            
        }
        .onAppear {
            if !ready {
                ready = true
                viewModel.getCategories()
            }
        }
        
    }
    
    @ViewBuilder
    private func RecipesList() -> some View {
        
        HStack(spacing: 25) {
            
            ForEach(viewModel.recipesBycategory, id: \.id) { recipe in
                
                NavigationLink(destination: RecipeView(slug: recipe.slug)) {
                    
                    RecipeItemView(recipe: recipe)
                    
                }
                
            }
            
        }
        
    }
    
    @ViewBuilder
    private func RecipesPlaceholder() -> some View {
        
        HStack(spacing: 25) {
            
            ForEach(1...5, id: \.self) { _ in
                
                RecipeItemPreview()
                
            }
            
        }
        .redacted(reason: .placeholder)
        
    }
}

struct HomeCategories_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            HomeView()
        }
    }
}
