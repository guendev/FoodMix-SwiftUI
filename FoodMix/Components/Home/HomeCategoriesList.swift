//
//  HomeCategoriesList.swift
//  FoodMix
//
//  Created by Yuan on 07/03/2022.
//

import SwiftUI

struct HomeCategoriesList: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    @Namespace var animation
    
    @State var showSheet: Bool = false
    
    @State var category: Category?
    
    @State var activeLink: Bool = false
    
    
    var body: some View {
        Group {
            
            TitleView(title: "Phân Nhóm") {
                
                NavigationLink(destination: CategoriesView(categories: viewModel.catgories)) {
                    
                    Text("Xem thêm")
                        .font(.custom(.customFont, size: 14))
                        .foregroundColor(.gray)
                    
                }
                
            }

                        
            ScrollView(.horizontal, showsIndicators: false) {
                
                ZStack {
                    
                    if viewModel.catgories.count > 0 {
                        
                        CategoriesList()
                        
                    }
                    
                    else {
                        
                        CategoriesPlaceholder()
                        
                    }
                    
                }
                .transition(.slide)
                
            }
            
        }
        .onChange(of: activeLink) { newValue in
            if !activeLink {
                category = nil
            }
        }
    }
    
    func current(category: Category) -> Bool {
        return viewModel.currentCategory?.id == category.id
    }
    
    @ViewBuilder
    private func CategoriesList() -> some View {
        HStack(spacing: 10) {
                                
            ForEach(viewModel.catgories, id: \.id) { item in
                
                Button {
                    
                    withAnimation {
                        viewModel.getRecipesByCategory(category: item)
                    }
                    
                } label: {
                    
                    Text(item.name)
                        .font(.custom(.customFont, size: 14))
                        .fontWeight(.semibold)
                        .foregroundColor(current(category: item) ? .white : Color("TextContent"))
                        .padding(.horizontal, 20)
                        .padding(.leading, 20)
                        .padding(.vertical, 10)
                        .background(
                            
                            Group {
                                
                                if current(category: item) {
                                    
                                    LinearGradient(gradient: Gradient(colors: [Color("Primary").opacity(0.7), Color("Primary")]), startPoint: .leading, endPoint: .trailing)
                                        .opacity(0.9)
                                        .cornerRadius(20)
                                        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                                        .matchedGeometryEffect(id: "CATEGORY", in: animation)
                                    
                                }
                                
                            }
                            
                        )
                        .overlay(
                            
                            RecipeAvatar(avatar: item.icon)
                                .scaledToFit()
                                .frame(width: 28)
                                .offset(x: 5)
                                .scaleEffect(current(category: item) ? 1.2 : 1)
                                .animation(.spring())
                            
                            ,alignment: .leading
                            
                        )
                    
                }
                .disabled(viewModel.loadingRecipesByCategory)
                
            }
            
        }
    }
    
    @ViewBuilder
    private func CategoriesPlaceholder() -> some View {
        
        HStack(spacing: 10) {
                                
            ForEach(1...5, id: \.self) { index in
                
                Text("Kem Lạnh")
                    .font(.custom(.customFont, size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(Color("TextContent"))
                    .padding(.horizontal, 20)
                    .padding(.leading, 20)
                    .padding(.vertical, 10)
                    .overlay(
                        
                        RecipeAvatar(avatar: "https://i.imgur.com/sJapZxD.png")
                            .scaledToFit()
                            .frame(width: 30)
                            .offset(x: 5)
                        
                        ,alignment: .leading
                        
                    )
                    .cornerRadius(20)
                
            }
            
        }
        .redacted(reason: .placeholder)
        
    }
}


struct HomeCategoriesList_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            HomeView()
            
        }
    }
}

