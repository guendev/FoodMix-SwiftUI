//
//  RecipeViewMode.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI
import Apollo

class RecipeViewModel: ReviewsViewModel {
                
    @Published var recipe: Recipe?
    
    @Published var loading: Bool = false
    
    var ready: Bool {
        get { recipe != nil }
    }
        
    @Published var offset: CGFloat = .zero
    @Published var stretchHeight: CGFloat = .zero
    
    @Published var bookmarked: Bookmark?
    @Published var checkedBookmark: Bool = false
    @Published var loadingBookmark: Bool = false
    
    // Auth Data
    @Published var auth: Bool = false
    @Published var currentUser: User?
    
    // Sub data
    private var subRecipe: Cancellable?
    
    // Random
    @Published var random: [Recipe] = []
    @Published var loadingRandom: Bool = false
    
    func getRecipe(_ slug: String, completion: @escaping () -> Void) -> Void {
        
        if loading {
            return
        }
        loading = true
        
        Network.shared.apollo.fetch(query: GetRecipeQuery(id: slug)) { [weak self] result in
            
            guard let self = self else {
                  return
            }
            
            switch result {
            
            case .success(let graphQLResult):
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getRecipe else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { break }
                
                self.reviewRecipe = recipe
                self.recipe = recipe
                self.loading = false
                
                completion()
                
                // sub recipe
            case .failure(_):
                break
            }
            
        }
    }
    
    func subRecipeAction() -> Void {
        subRecipe = Network.shared.apollo.subscribe(subscription: SubRecipeSubscription(id: recipe!.slug)) { [weak self] result in
            
            guard let self = self else {
                  return
            }
            
            switch result {
            
            case .success(let graphQLResult):
                
                                
                if graphQLResult.errors != nil {
                    break
                }
                                
                guard let rawData = graphQLResult.data?.subRecipe else { break }
                
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { break }
                
                self.recipe?.name = recipe.name
                self.recipe?.avatar = recipe.avatar
                self.recipe?.content = recipe.content
                self.recipe?.totalRating = recipe.totalRating
                self.recipe?.countRating = recipe.countRating
                
                
            case .failure(_):
                break
            
            }

            
        }
    }
    
    func getBookmark() -> Void {
        
        if recipe == nil || checkedBookmark || !auth { return }
        
        checkedBookmark = true
        loadingBookmark = true
                        
        Network.shared.apollo.fetch(query: CheckBookmarkQuery(id: recipe!.slug), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                if let rawData = graphQLResult.data?.checkBookmark {
                    // đã book mark
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                    guard let bookmarked = try? JSONDecoder().decode(Bookmark.self, from: jsonData) else { break }
                    
                    self.bookmarked = bookmarked
                } else {
                    self.bookmarked = nil
                }
                self.loadingBookmark = false
                
                // sub recipe
                
            case .failure(_):
                break
            }
            
        }
        
    }
    
    func bookmarkAction() -> Void {
        if !auth || !ready || loadingBookmark {
            // chưa đăng nhập || công thức chưa tải xong || dg tải
            return
        }
        loadingBookmark = true
                
        Network.shared.apollo.perform(mutation: BookmarkToggleMutation(id: recipe!.slug)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                if let rawData = graphQLResult.data?.bookmarkToggle {
                    // đã book mark
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                    guard let bookmarked = try? JSONDecoder().decode(Bookmark.self, from: jsonData) else { break }
                    
                    self.bookmarked = bookmarked
                } else {
                    self.bookmarked = nil
                }
                
                self.loadingBookmark = false
                
            case .failure(let error):
                print("❌ DEBUG: \(error)")
                break
            }
        }
    }
    
    func reListenRecipe() -> Void {
        if recipe != nil && subRecipe != nil {
            debugPrint("Re sub recipe")
            subRecipeAction()
        }
    }
    
    func stopListenRecipe() -> Void {
        debugPrint("stop sub recipe")
        subRecipe?.cancel()
    }
    
    func getRandom() -> Void {
        
        if !random.isEmpty || loadingRandom { return }
        loadingRandom = true
        
        Network.shared.apollo.fetch(query: GetRandomRecipesQuery(size: 3)) { [weak self] result in
            
            guard let self = self else {
                  return
            }
            
            switch result {
            case .success(let graphQLResult):
              
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getRandomRecipes else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { continue }
                    
                    self.random.append(recipe)
                }
                
                self.loadingRandom = false
                                
                
            case .failure(_):
                break
            }
            
        }
        
    }
    
}

extension RecipeViewModel {
    func setOffset(_ rect: CGRect) -> CGFloat {
        offset = rect.minY
        return .zero
    }
}
