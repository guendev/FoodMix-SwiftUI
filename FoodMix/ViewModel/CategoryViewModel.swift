//
//  CategoryViewModel.swift
//  FoodMix
//
//  Created by Yuan on 03/03/2022.
//

import SwiftUI

class CategoryViewModel: ObservableObject {
    
    @Published var category: Category?
    
    @Published var current = FilterItem(name: "Mới Nhất", value: "createdAt") {
        didSet {
            
            // on change
            page = 0
            emptyRecipe = false
            recipes.removeAll()
            getRecipes()
            
        }
    }
    @Published var loading: Bool = false
    @Published var page: Int = 0
    @Published var emptyRecipe: Bool = false
    
    @Published var offset: CGFloat = .zero
    
    @Published var recipes: [Recipe] = [Recipe]()
    
    
    
    func getRecipes() -> Void {
        
        guard category != nil else { return }
        if loading { return }
        
        Network.shared.apollo.fetch(query: CategoryToRecipesQuery(slug: category!.slug, filter: SortOption(sort: current.value, page: "\(page)", limit: "10"))) { [weak self] result in
            
            guard let self = self else { return }
            
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
                    
                    self.recipes.append(recipe)
                }
                
                self.emptyRecipe = rawData.isEmpty
                self.loading = false
                self.page += 1
                
            case .failure(_):
                break
            }
            
        }
        
    }
    
}
