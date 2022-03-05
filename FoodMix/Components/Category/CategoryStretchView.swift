//
//  CategoryStretchView.swift
//  FoodMix
//
//  Created by Yuan on 03/03/2022.
//

import SwiftUI

struct CategoryStretchView: View {
    
    @EnvironmentObject var viewModel: CategoryViewModel
    
    @State private var show: Bool = false
    
    var category: Category
    
    
    var body: some View {
        VStack(spacing: 0) {
            
            StretchHeader(height: 200, offset: $viewModel.offset) {
                Color.clear
                    .overlay(
                        
                        RecipeAvatar(avatar: category.avatar)
                            .scaledToFill()
                        
                    )
                    .clipped()
            }
            
            Color.clear.frame(height: 50)
                .overlay(
                    
                    Circle()
                        .fill(Color("AvatarHeader"))
                        .frame(width: 120, height: 120, alignment: .center)
                        .overlay(
                            
                            RecipeAvatar(avatar: category.icon ?? "https://i.imgur.com/sJapZxD.png")
                                .scaledToFit()
                                .frame(width: 95, height: 95)
                                .scaleEffect(show ? 1 : 0.5)
                                .opacity(show ? 1 : 0)
                                .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                            
                        )
                        .offset(x: -50)
                    
                    , alignment: .bottomTrailing
                )
            
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring()) {
                    show = true
                }
            }
            
        }
    }
}

struct CategoryStretchView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(
            id: "1",
            name: "Gà Quay",
            slug: "ga-quay",
            avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFKYmf6jHItCbfL8txsSCFfsCW254JYLEeNQ&usqp=CAU",
            content: "You can change your ContentView body in this way, and when you dismiss the sheet view, it will navigate to DashboardView",
            icon: "https://i.imgur.com/sJapZxD.png"
        ))
    }
}
