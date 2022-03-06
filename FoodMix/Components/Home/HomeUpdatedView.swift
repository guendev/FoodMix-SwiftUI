//
//  HomeUpdatedView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct HomeUpdatedView: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
    
    @State var getFirst: Bool = false
    
    var body: some View {
        VStack(spacing: 25) {
            
            TitleView(title: "Công Thức Mới") {}
            
            VStack(spacing: 30) {
                
                ForEach(viewModel.updatedRecipes, id:\.id) { item in
                    
                    NavigationLink( destination: RecipeView(slug: item.slug)) {
                        
                        RecipeItemHorizontal(recipe: item)
                        
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                }
                
                if viewModel.loadingUpdated {
                    
                    RecipeItemHorizontalPreview.preview()
                    
                }
                
                
                if !viewModel.emptyUpdated {
                    Button {
                        
                        viewModel.getUpdateRecipes()
                        
                    } label: {
                        
                        Text("Xem Thêm".uppercased())
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color("Primary"))
                            .cornerRadius(15)
                        
                    }
                    .disabled(viewModel.loadingUpdated)
                } else {
                    
                    EmptyContent()
                    
                }
                
            }
        }
        .onAppear {
            
            if getFirst {
                return
            }
            getFirst = true
            
            viewModel.getUpdateRecipes()
            
        }
    }
    
    @ViewBuilder
    private func ListPlaceholder() -> some View {
        Group {
            
            ForEach(1...3, id: \.self) { _ in
                
                RecipeItemHorizontalPreview()
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                
            }
            
        }
        .redacted(reason: .placeholder)
    }
}

struct HomeUpdatedView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            HomeView()
        }
    }
}
