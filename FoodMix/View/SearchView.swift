//
//  SearchView.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var viewModel: SearchViewModel = SearchViewModel()
        
    var body: some View {
        
        VStack(spacing: 25) {
            
            SearchBarView()
            
            ScrollView(showsIndicators: false) {
                
                ZStack {
                    
                    if viewModel.keyword.isEmpty {
                        
                        SearchHistoryView()
                        
                    } else {
                        
                        VStack(spacing: 25) {
                            
                            TitleView(title: "Kết Quả") {}
                            
                            ForEach(viewModel.recipes, id:\.id) { item in
                                
                                NavigationLink( destination: RecipeView(slug: item.slug)) {
                                    
                                    RecipeItemHorizontal(recipe: item)
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                                
                            }
                            
                            if viewModel.loading {
                                
                                RecipeItemHorizontalPreview.preview()
                                
                            }
                            
                            if viewModel.emptyRecipes {
                                
                                EmptyContent()
                                
                            } else {
                                
                                PrimaryButtonView(title: "Xem Thêm", active: $viewModel.loading) {
                                    
                                    viewModel.searchRecipes {
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                .transition(.opacity)
                
            }
            .padding(.horizontal, 25)
            
        }
        .background(Color("Background").ignoresSafeArea())
        .environmentObject(viewModel)
        
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper {
                
                SearchView()
                
            }
            PreviewWrapper {
                
                SearchView()
                
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
