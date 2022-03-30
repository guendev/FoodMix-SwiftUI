//
//  ReviewsViewModel.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI
import Apollo

class ReviewsViewModel: ObservableObject {
    
    @Published var reviewRecipe: Recipe?
    @Published var reviewLimit: Int = 10

    @Published var reviews: [Review] = [Review]()
    @Published var loadingReviews: Bool = false
    @Published var emptyReviews: Bool = false
    @Published var pageReviews: Int = 0
    
    func getReviews(completion: @escaping () -> Void) -> Void {
        if reviewRecipe == nil || loadingReviews { return }
                
        loadingReviews = true
        let filter = SortOption(sort: "createdAt", page: "\(pageReviews)", limit: "\(reviewLimit)")
        Network.shared.apollo.fetch(query: GetReviewsQuery(id: reviewRecipe!.slug, filter: filter)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                                
                guard let rawData = graphQLResult.data?.getReviews else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let review = try? JSONDecoder().decode(Review.self, from: jsonData) else { continue }
                    
                    self.reviews.append(review)
                }
                
                self.loadingReviews = false
                self.emptyReviews = rawData.isEmpty
                
                completion()
                
                // sub recipe
            case .failure(_):
                break
            }
            
        }
        
    }
    
    func subNewReviewAction() -> Void {
        if reviewRecipe == nil { return }
        Network.shared.apollo.subscribe(subscription: SubNewReviewsSubscription(id: reviewRecipe!.slug)) { [weak self] result in
            
            guard let self = self else {
                  return
            }
            
            switch result {
            
            case .success(let graphQLResult):
                
                                
                if graphQLResult.errors != nil {
                    break
                }
                                
                guard let rawData = graphQLResult.data?.subNewReviews else { break }
                
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let review = try? JSONDecoder().decode(Review.self, from: jsonData) else { break }
                
                self.reviews.insert(review, at: 0)
                
                Network.store.withinReadWriteTransaction { transaction in
                    
                    let filter: SortOption = SortOption(sort: "createdAt", page: "0", limit: "\(self.reviewLimit)")
                    let query = GetReviewsQuery(id: self.reviewRecipe!.slug, filter: filter)
                
                    try? transaction.update(query: query) { cache in
                        
                        let newCache = try? GetReviewsQuery.Data.GetReview(jsonObject: rawData.jsonObject)
                        
                        
                        cache.getReviews.insert(newCache, at: 0)
                        
                    }
                    
                }
                
            case .failure(_):
                break
            
            }
            
        }
    }
    
}
