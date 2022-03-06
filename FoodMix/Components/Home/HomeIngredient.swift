//
//  HomeIngredient.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HomeIngredient: View {
    
    @EnvironmentObject var viewModel: HomeViewModel
        
    @State var showSheet: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            TitleView(title: "Nguyên Liệu") {}
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 20) {
                    
                    ForEach(viewModel.ingredients, id: \.id) { item in
                        
                        Button {
                            
                            withAnimation {
                                viewModel.currentIngredient = item
                                showSheet = true
                            }
                            
                        } label: {
                            
                            VStack(spacing: 15) {
                                
                                RecipeAvatar(avatar: item.image)
                                    .scaledToFit()
                                    .frame(height: 50)
                                
                                Text(item.name)
                                    .font(.caption)
                                    .fontWeight(.semibold)
                                    .foregroundColor(Color("TextContent"))
                                
                            }
                            
                            
                        }
                        
                        
                    }
                    
                    if viewModel.ingredients.isEmpty {
                        
                        Group {
                            
                            ForEach(0 ..< 5) { item in
                                VStack(spacing: 15) {
                                    
                                    Image("food")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 50)
                                    
                                    Text("Hành Lá")
                                        .font(.caption)
                                        .fontWeight(.semibold)
                                        .foregroundColor(Color("TextContent"))
                                    
                                }
                            }
                            
                        }
                        .redacted(reason: .placeholder)
                        
                    }
                    
                }
            }
            
        }
        .onAppear {
            viewModel.getIngredients()
        }
        .sheet(isPresented: $showSheet) {
            IngredientView(ingredient: viewModel.currentIngredient!)
        }
        
    }
}

struct HomeIngredient_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            HomeView()
            
        }
        .environment(\.colorScheme, .dark)
    }
}
