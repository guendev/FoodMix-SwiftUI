//
//  RecipeAbout.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeAbout: View {
    
    @State var limitLine: Bool = false
    
    @State var string: CGFloat = .zero
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            
            TitleView(title: "Giới Thiệu") {}
            
            Group {
                
                if viewModel.ready {
                    Text("\(viewModel.recipe?.content ?? "")")
                } else {
                    Text("There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.")
                }
                
            }
                .font(.subheadline)
                .lineSpacing(6)
                .foregroundColor(Color("TextContent"))
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxHeight: limitLine ? 200: nil)
                .clipped()
                .redacted(reason: viewModel.ready ? [] : .placeholder)
            
        }
        
    }
}

struct RecipeAbout_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(slug: "le-thi-kim-ngan")
            
        }
    }
}
