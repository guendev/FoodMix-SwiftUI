//
//  RecipeAuthorView.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeAuthorView: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        Group {
            
            if viewModel.ready {
                
                HStack(spacing: 15) {
                    
                    NavigationLink(destination: ProfileView(slug: viewModel.recipe!.user!.slug)) {
                        
                        RecipeAvatar(avatar: viewModel.recipe?.user?.avatar)
                            .scaledToFit()
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                        
                    }
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        NavigationLink(destination: ProfileView(slug: viewModel.recipe!.user!.slug)) {
                            
                            Text(viewModel.recipe?.user?.name ?? "")
                                .foregroundColor(Color("TextTitle"))
                                .font(.custom(.customFont, size: 16))
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        if viewModel.recipe!.user!.countRecipe! > 0 {
                            
                            Text("\(viewModel.recipe!.user!.countRecipe!) Đánh giá")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                        }
                        
                        if viewModel.recipe!.user!.countRecipe! > 0 {
                            
                            Text("\(viewModel.recipe!.user!.countRecipe!) Đánh giá")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .trailing, spacing: 4) {
                        
                        HStack {
                            
                            Text(String(format: "%.1f", viewModel.recipe!.rating()))
                                .font(.caption)
                                .foregroundColor(Color("TextContent"))
                            
                            
                            StarRating(rating: viewModel.recipe!.rating(), size: 13, spacing: 3)
                            
                        }
                        
                        if viewModel.recipe!.countRating! > 0 {
                            
                            Text("\(viewModel.recipe!.countRating!) Đánh giá")
                                .font(.caption)
                                .foregroundColor(Color("TextContent"))
                            
                        } else {
                            Text("Đánh giá đầu")
                                .font(.caption)
                                .foregroundColor(Color("TextContent"))
                        }
                        
                    }
                    
                    
                }
                
            } else {
                HStack(spacing: 15) {
                    
                    Image("avatar")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        Text("Kim Ngân")
                            .font(.custom(.customFont, size: 19))
                        
                        Text("120 Công thức")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading, spacing: 4) {
                        
                        HStack {
                            
                            Text("4.5")
                                .foregroundColor(.black.opacity(0.7))
                            
                            
                            StarRating(rating: 4.5, size: 13, spacing: 3)
                            
                        }
                        
                        Text("120 Đánh giá")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                    }
                    
                    
                }
                .redacted(reason: .placeholder)
            }
            
        }
    }
}

struct RecipeAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(slug: "le-thi-kim-ngan")
            
        }
    }
}
