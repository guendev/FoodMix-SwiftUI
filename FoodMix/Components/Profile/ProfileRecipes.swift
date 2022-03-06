//
//  ProfileRecipes.swift
//  FoodMix
//
//  Created by Yuan on 15/03/2022.
//

import SwiftUI

struct ProfileRecipes: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            ForEach(viewModel.recipes, id: \.id) { recipe in
                
                NavigationLink( destination: RecipeView(slug: recipe.slug)) {
                    RecipeItemHorizontal(recipe: recipe)
                }

                
            }
            
            if !viewModel.ready || viewModel.loadingContent {
                
                RecipeItemHorizontalPreview.preview()
                
            }
            
        }
        
    }
}

struct ProfileRecipes_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            ProfileView(slug: "nguyen")
            
        }
        
    }
}
