//
//  IngredientViewModel.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI
import Apollo

class IngredientViewModel: ObservableObject {
    
    @Published var ingredient: IngredientItem?
    
    @Published var recipes: [Recipe] = [Recipe]()
    @Published var loading: Bool = true
    @Published var page: Int = 0
    
    @Published var empty: Bool = false
    
    fileprivate func filter() -> SortOption {
        return SortOption(sort: "createdAt", page: "\(page)", limit: "10")
    }
    
    func getRecipes() -> Void {
        
        loading = true
        
        
        
        Network.shared.apollo.fetch(query: GetSearchRecipesByIngredientQuery(name: ingredient!.name, filter: filter())) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getSearchRecipesByIngredient else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { continue }
                    
                    self.recipes.append(recipe)
                }
                
                self.empty = rawData.isEmpty
                self.loading = false
                self.page += 1
                
            case .failure(_):
                break
            }
            
        }
        
    }
    
}
