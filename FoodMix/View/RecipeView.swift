//
//  RecipeView.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeView: View {
    
    var slug: String
    
    @StateObject var viewModel: RecipeViewModel = RecipeViewModel()
        
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            
            LazyVStack(spacing: 0) {
                
                RecipeStretchAvatar()
                
                VStack(spacing: 25) {
                    
                    RecipeAuthorView()
                    
                    
                    RecipeAbout()
                                        
                    // RecipeIngredientsView()
                    
                    // RecipeStepperView()
                    
                    if viewModel.reviewRecipe != nil {
                        
                        RecipeReviews()
                        
                    }
                    
                    // RecipeRandomView()
                    
                }
                .offset(y: -20)
                .padding(.horizontal, 25)
                
            }
    
            
        }
        .ignoresSafeArea(.container, edges: .top)
        .background(Color("Background").ignoresSafeArea())
        .overlay(
            RecipeAppBar()
            
            ,alignment: .top
        )
        .onAppear {
            viewModel.reListenRecipe()
        }
        .onDisappear {
            viewModel.stopListenRecipe()
        }
        .initView {
            viewModel.getRecipe(slug) {
                viewModel.getBookmark()
                viewModel.subRecipeAction()
            }
        }
        .asyncAuthData(auth: $viewModel.auth, currentUser: $viewModel.currentUser)
        .environmentObject(viewModel)
    }
    
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(slug: "le-thi-kim-ngan")
            
        }
    }
}
