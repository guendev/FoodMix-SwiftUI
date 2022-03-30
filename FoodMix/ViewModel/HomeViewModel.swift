//
//  HomeViewModel.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI
import FirebaseDatabase

class HomeViewModel: ObservableObject {
    
    @Published var currentCategory: Category?
    @Published var catgories: [Category] = [Category]()
    @Published var loadingCategories: Bool = false
    
    @Published var recipesBycategory: [Recipe] = [Recipe]()
    @Published var loadingRecipesByCategory: Bool = false
    @Published var emtyRecipesByCategory: Bool = false
    
    @Published var ingredients: [IngredientItem] = [IngredientItem]()
    @Published var readyIngredient: Bool = false
    @Published var currentIngredient: IngredientItem?
    
    @Published var updatedRecipes: [Recipe] = [Recipe]()
    @Published var loadingUpdated: Bool = false
    @Published var emptyUpdated: Bool = false
    var page: Int = 0
    
    
    func getCategories() -> Void {
        
        if loadingCategories {
            return
        }
        loadingCategories = true
                
        Network.shared.apollo.fetch(query: GetAllCategoriesQuery()) { [weak self] result in
            guard let self = self else {
                  return
            }
            
            switch result {
            case .success(let graphQLResult):
              
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getAllCategories else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let category = try? JSONDecoder().decode(Category.self, from: jsonData) else { continue }
                    
                    self.catgories.append(category)
                }
                
                if self.catgories.count > 0 {
                    
                    self.loadingCategories = false
                                    
                    self.getRecipesByCategory(category: self.catgories.first!)
                                    
                }
                                
                
            case .failure(_):
                break
            }
            
        }
    
    }
    
    func getRecipesByCategory(category : Category) -> Void {
        
        if currentCategory?.id == category.id || loadingRecipesByCategory {
            // dừng nếu truyền vào cùng category hoặc đang tải
            return
        }
        currentCategory = category
        emtyRecipesByCategory = false
        loadingRecipesByCategory = true
        
        // reset
        recipesBycategory = []
        
        Network.shared.apollo.fetch(query: GetRecipesByCategoryQuery(slug: currentCategory!.slug, filter: SortOption(sort: "views", page: "0", limit: "10"))) { [weak self] result in
            
            guard let self = self else {
                  return
            }
            
            switch result {
            case .success(let graphQLResult):
              
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getRecipesByCategory else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { continue }
                    
                    self.recipesBycategory.append(recipe)
                }
                
                self.emtyRecipesByCategory = self.recipesBycategory.isEmpty
                self.loadingRecipesByCategory = false
                
            case .failure(_):
                break
            }
            
        }
        
    }
    
    func getIngredients() -> Void {
        if readyIngredient {
            return
        }
        
        self.readyIngredient = false
        
        DATABASE.ref.child("ingredients").observe(.childAdded) { snapshot in
            
            if !snapshot.exists() {
                return
            }
            let dict = snapshot.value as? NSDictionary
            
            let item: IngredientItem = IngredientItem(
                name: dict?["name"] as? String ?? "",
                image: dict?["image"] as? String ?? "",
                content: dict?["content"] as? String ?? "",
                properties: []
            )
            
            self.ingredients.append(item)
            
        }
                
    }
    
    func getUpdateRecipes() -> Void {
        if loadingUpdated || emptyUpdated {
            return
        }
        loadingUpdated = true
        
        Network.shared.apollo.fetch(query: HomeUpdatedQuery(filter: SortOption(sort: "createdAt", page: "\(page)", limit: "10"))) { [weak self] result in
            guard let self = self else {
                  return
            }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                                
                guard let recipes = graphQLResult.data?.getRecipes else { break }
                
                if recipes.isEmpty {
                    self.emptyUpdated = true
                    self.loadingUpdated = false
                    break
                }
                
                recipes.forEach({ item in
                    
                    if let item = item {
                        
                        self.updatedRecipes.append(
                            Recipe(
                                id: item.id,
                                name: item.name,
                                slug: item.slug,
                                avatar: item.avatar,
                                content: item.content,
                                user: User(
                                    id: item.user!.id,
                                    name: item.user!.name,
                                    slug: item.user!.slug,
                                    avatar: item.user!.avatar
                                ),
                                countRating: item.countRating,
                                totalRating: item.totalRating
                            )
                        )
                        
                    }
                    
                })
                
                // tăng biến đếm
                self.page += 1
                self.loadingUpdated = false
                
            case .failure(_):
                break
            
            }
            
        }
        
    }
    
}
