//
//  RecipeItemHorizontal.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct RecipeItemHorizontal: View {
    
    var recipe: Recipe
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            RecipeAvatar(avatar: recipe.avatar)
                .scaledToFill()
                .frame(width: 140, height: 100)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text(recipe.name)
                    .font(.custom(.customFont, size: 17))
                    .foregroundColor(Color("TextTitle"))
                    .lineLimit(1)
                
                StarRating(rating: 3.4, size: 13)
                
                Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ")
                    .font(.subheadline)
                    .lineSpacing(5)
                    .lineLimit(2)
                    .foregroundColor(Color("TextContent"))
                
            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
        }
        .padding()
        .background(Color("WhiteBackground"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
        
    }
}


struct RecipeItemHorizontalPreview: View {
        
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            Image("food")
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 100)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("Lợn Xào Sả Ớt")
                    .foregroundColor(Color("TextTitle"))
                    .font(.custom(.customFont, size: 17))
                    .fontWeight(.semibold)
                    .lineLimit(1)
                
                StarRating(rating: 3.4, size: 13)
                
                Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ")
                    .font(.subheadline)
                    .lineSpacing(5)
                    .lineLimit(2)
                    .foregroundColor(Color("TextContent"))

            }
            .frame(maxWidth: .infinity, alignment: .topLeading)
            
        }
        .padding()
        .background(Color("WhiteBackground"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
        
    }
    
    static func preview() -> some View {
        
        Group {
            
            ForEach(1...3, id: \.self) { _ in
                
                RecipeItemHorizontalPreview()
                
            }
            
        }
        .redacted(reason: .placeholder)
        
    }
}



struct RecipeItemHorizontal_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            VStack(spacing: 25) {
                
                RecipeItemHorizontalPreview.preview()
                
            }
            .padding(25)
            
        }
        .background(Color("Background").ignoresSafeArea())
        
    }
}
