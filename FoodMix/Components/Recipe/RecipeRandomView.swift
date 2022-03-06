//
//  RecipeRandomView.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI

struct RecipeRandomView: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
            
            TitleView(title: "Có Thể Bạn Thích") {
                
            }
            
            Group {
                
                ForEach(viewModel.random) { recipe in
                    
                    RecipeItemHorizontal(recipe: recipe)
                    
                }
                
            }
            
            if viewModel.loadingRandom {
                
                RecipeItemHorizontalPreview.preview()
                
            }
            
        }
        .onAppear {
            print("123456789")
            viewModel.getRandom()
        }
        
    }
}

struct RecipeRandomView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            PreviewWrapper {
                
                RecipeView(slug: "le-thi-kim-ngan")
                
            }
        }
        
    }
}
