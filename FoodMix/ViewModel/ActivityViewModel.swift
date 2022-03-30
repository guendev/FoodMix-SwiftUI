//
//  ActivityViewModel.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

class ActivityViewModel: ObservableObject {
    
    @Published var authors: [User] = []
    
    @Published var loadingFirst: Bool = false
    @Published var loading: Bool = false
    @Published var page: Int = 0
    
    @Published var current: FilterItem = FilterItem(name: "Công Thức", value: "countRecipe")
    
    init() {
        getAuthors()
    }
    
    func getAuthors() -> Void {
        if loading { return }
        loading = true
        Network.shared.apollo.fetch(query: GetUsersQuery(filter: SortOption(sort: current.value, page: "\(page)", limit: "10"))) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
              
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getUsers else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let author = try? JSONDecoder().decode(User.self, from: jsonData) else { continue }
                    
                    self.authors.append(author)
                }
                
                self.loadingFirst = false
                self.loading = false
                self.page += 1
                
            case .failure(_):
                break
            }
            
        }
    }
    
}
