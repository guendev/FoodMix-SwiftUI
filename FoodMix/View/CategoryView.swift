//
//  CategoryView.swift
//  FoodMix
//
//  Created by Yuan on 03/03/2022.
//

import SwiftUI

struct CategoryView: View {
    
    @StateObject var viewModel: CategoryViewModel = CategoryViewModel()
    
    var category: Category
    
    let filters: [FilterItem] = [
        FilterItem(name: "Mới Nhất", value: "createdAt"),
        FilterItem(name: "Lượt Xem", value: "views")
    ]
    
    @State var ready: Bool = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(alignment: .leading, spacing: 0) {
                
                CategoryStretchView(category: category)
                
                VStack(alignment: .leading, spacing: 25) {
                    
                    CategoryAboutView(category: category)
                    
                    TitleView(title: "Món Ăn") {
                        
                        TabFilterView<FilterItem>(
                            filters: filters,
                            current: $viewModel.current,
                            title: { item in
                                return item.name
                            },
                            isCurrent: { tab, current in
                                return tab.value == current.value
                            }
                        )
                        
                    }
                    .disabled(!ready || viewModel.loading)
                    
                    VStack(spacing: 25) {
                        
                        ForEach(viewModel.recipes, id:\.id) { item in
                            
                            NavigationLink( destination: RecipeView(slug: item.slug)) {
                                RecipeItemHorizontal(recipe: item)
                            }

                            
                        }
                        
                        if viewModel.loading {
                            
                            RecipeItemHorizontalPreview.preview()
                            
                        }
                        
                        if viewModel.emptyRecipe {
                            
                            EmptyContent()
                                .withAlignment(alignment: .center)
                            
                        } else {
                            
                            PrimaryButtonView(title: "Xem Thêm", active: $viewModel.loading) {
                                viewModel.getRecipes()
                                
                            }
                            .disabled(viewModel.loading)
                            .redacted(reason: viewModel.loading ? .placeholder : [])
                            
                        }
                        
                    }
                    
                }
                .offset(y: -25)
                .padding(.horizontal, 25)
                
            }
            
        }
        .ignoresSafeArea(.container, edges: .top)
        .background(Color("Background").ignoresSafeArea())
        .overlay(
            
            AppBar(title: "\(category.name)", back: true, animation: viewModel.offset < -150) {
                
            }
            .padding(.horizontal, 25)
            .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: -5)
            .foregroundColor(.white)
            .background(
                Color("Primary")
                    .opacity(viewModel.offset < -150 ? 1 : 0)
                    .ignoresSafeArea()
            )
            .animation(.easeIn)
            
            ,alignment: .top
            
        )
        .initView {
            DispatchQueue.main.async {
                viewModel.category = category
                
                ready = true
                
                viewModel.getRecipes()
            }
        }
        .environmentObject(viewModel)
        
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            PreviewWrapper {
                
                CategoryView(category: Category(id: "1", name: "Gà Quay", slug: "kem-lanh-p-z16rtpv", avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFKYmf6jHItCbfL8txsSCFfsCW254JYLEeNQ&usqp=CAU", content: "You can change your ContentView body in this way, and when you dismiss the sheet view, it will navigate to DashboardView", icon: "https://i.imgur.com/sJapZxD.png"))
                
            }
            PreviewWrapper {
                
                CategoryView(category: Category(id: "1", name: "Gà Quay", slug: "kem-lanh-p-z16rtpv", avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFKYmf6jHItCbfL8txsSCFfsCW254JYLEeNQ&usqp=CAU", content: "You can change your ContentView body in this way, and when you dismiss the sheet view, it will navigate to DashboardView", icon: "https://i.imgur.com/sJapZxD.png"))
                
            }
            .environment(\.colorScheme, .dark)
        }
        
    }
}
