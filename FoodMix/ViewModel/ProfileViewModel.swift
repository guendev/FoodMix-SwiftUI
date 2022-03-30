//
//  ProfileViewModel.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.


import SwiftUI

class ProfileViewModel: ObservableObject {
    
    @Published var user: User?
    
    var ready: Bool {
        get {
            return user != nil
        }
    }
    
    @Published var loadingContent: Bool = false
    @Published var emptyContent: Bool = false
    @Published var page: Int = 0
    @Published var recipes: [Recipe] = [Recipe]()
    @Published var reviews: [Review] = [Review]()
    
    @Published var current: FilterItem = FilterItem(name: "Đánh Giá", value: "reviews") {
        
        didSet {
            
            changeFilter()
            
        }
        
    }
    
    
    @Published var offset: CGFloat = .zero
    
    var filter: SortOption {
        get {
            return SortOption(sort: "createdAt", page: "\(page)", limit: "10")
        }
    }
    
    
    func getProfile(slug: String, completion: @escaping () -> Void) {
        Network.shared.apollo.fetch(query: GetProfileQuery(id: slug)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
              
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getProfile else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let profile = try? JSONDecoder().decode(User.self, from: jsonData) else { break }
                
                self.user = profile
                
                completion()
                
            case .failure(_):
                break
            }
            
        }
    }
    
    
    func getRecipes() -> Void {
        
        loadingContent = true
        
        Network.shared.apollo.fetch(query: GetRecipesProfileQuery(id: user!.slug, filter: filter)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                                
                guard let rawData = graphQLResult.data?.getRecipesProfile else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let recipe = try? JSONDecoder().decode(Recipe.self, from: jsonData) else { continue }
                    
                    self.recipes.append(recipe)
                }
                self.page += 1
                self.emptyContent = rawData.isEmpty
                self.loadingContent = false
                
                
            case .failure(_):
                break
            }
            
        }
        
    }
    
    func getReviews() -> Void {
        
        loadingContent = true
        
        Network.shared.apollo.fetch(query: GetReviewsProfileQuery(id: user!.slug, filter: filter)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
                
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                                
                guard let rawData = graphQLResult.data?.getReviewsProfile else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let review = try? JSONDecoder().decode(Review.self, from: jsonData) else { continue }
                                        
                    self.reviews.append(review)
                }
                self.page += 1
                self.emptyContent = rawData.isEmpty
                self.loadingContent = false
                
            case .failure(_):
                break
            }
        }
    }
    
    func getContent() -> Void {
        if current.value == "recipes" {
            getRecipes()
        } else {
            getReviews()
        }
    }
    
    func changeFilter() -> Void {
        reviews.removeAll()
        recipes.removeAll()
        page = 0
        emptyContent = false
        getContent()
    }
}
