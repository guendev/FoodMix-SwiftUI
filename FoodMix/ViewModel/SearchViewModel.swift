//
//  SearchViewModel.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI
import CoreData

class SearchViewModel: ObservableObject {
    
    @Published var keyword: String = ""
    
    @Published var recipes: [Recipe] = [Recipe]()
    
    @Published var loading: Bool = false
    @Published var emptyRecipes: Bool = false
    
    @Published var category: Category?
    
    @Published var page: Int = 0
    
    
    func searchDebounce(completion: @escaping () -> Void) -> Void {
        
        if keyword.isEmpty { return }
        
        DispatchQueue.main.asyncDeduped(target: self, after: 0.1) { [weak self] in
            
            guard let self = self else { return }
            
            if self.loading { return }
            
            // reset data
            self.page = 0
            self.recipes.removeAll()
            
            self.loading = true
            
            Network.shared.apollo.fetch(query: GetSearchRecipesQuery(filter: SearchRecipeFilter(keyword: self.keyword, category: self.category?.slug, page: String(self.page), limit: "10"))) { [weak self] result in
                
                guard let this = self else { return }
                
                switch result {
                case .success(let graphQLResult):
                  
                    if graphQLResult.errors != nil {
                        break
                    }
                    
                    guard let rawData = graphQLResult.data?.getSearchRecipes else { break }
                    
                    for item in rawData {
                        guard let item = item else { continue }
                        guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                        guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { continue }
                        
                        this.recipes.append(recipe)
                    }
                    
                    this.emptyRecipes = rawData.isEmpty
                    this.loading = false
                    this.page += 1
                    
                    completion()
                    
                    
                    
                case .failure(_):
                    break
                }
                
            }
            
            
        }
        
    }
    
    func searchRecipes(completion: @escaping () -> Void) -> Void {
        
        if loading { return }
        loading = true
        
        Network.shared.apollo.fetch(query: GetSearchRecipesQuery(filter: SearchRecipeFilter(keyword: self.keyword, category: self.category?.slug, page: String(self.page), limit: "10"))) { [weak self] result in
            
            guard let this = self else { return }
            
            switch result {
            case .success(let graphQLResult):
              
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getSearchRecipes else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { continue }
                    
                    this.recipes.append(recipe)
                }
                
                this.emptyRecipes = rawData.isEmpty
                this.loading = false
                this.page += 1
                
                completion()
                
                
                
            case .failure(_):
                break
            }
            
        }
        
    }
    
}
