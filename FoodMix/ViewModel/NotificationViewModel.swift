//
//  NotificationViewModel.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI
import Apollo

class NotificationViewModel: ObservableObject {
    
    @Published var noties: [Notification] = []
    
    @Published var loading: Bool = false
    @Published var empty: Bool = false
    @Published var page: Int = 0
    
    @Published var subNotification: Cancellable?
    
    
    func getNotifies() -> Void {
        if loading { return }
        loading.toggle()
        
        let filter = SortOption(sort: "createdAt", page: "\(page)", limit: "10")
        Network.shared.apollo.fetch(query: GetNotificationsQuery(filter: filter)) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success(let graphQLResult):
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.getNotifications else { break }
                
                for item in rawData {
                    guard let item = item else { continue }
                    guard let jsonData = try? JSONSerialization.data(withJSONObject: item.jsonObject) else { continue }
                    guard let notify = try? JSONDecoder().decode(Notification.self, from: jsonData) else { continue }
                    
                    self.noties.append(notify)
                }
                
                self.empty = rawData.isEmpty
                self.page += 1
                self.loading = false
                
            case .failure(_):
                break
                
            }
            
        }
    }
    
    func subNotificationAction() -> Void {
        
        subNotification = Network.shared.apollo.subscribe(subscription: SubNotificationSubscription()) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    self.subNotification?.cancel()
                    break
                }
                
                guard let rawData = graphQLResult.data?.subNotification else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                guard let notify = try? JSONDecoder().decode(Notification.self, from: jsonData) else { break }
                
                self.noties.insert(notify, at: 0)
                
                // di đè data
                
                Network.store.withinReadWriteTransaction { transaction in
                    
                    let query = GetNotificationsQuery(filter: SortOption(sort: "createdAt", page: "0", limit: "10"))
                    
                    try? transaction.update(query: query) { cache in
                        
                        guard let newNotify = try? GetNotificationsQuery.Data.GetNotification.init(jsonObject: rawData.jsonObject) else { return }
                        
                        cache.getNotifications.insert(newNotify, at: 0)
                        
                    }
                    
                }
                
                
            case .failure(_):
                break
            }
            
        }
        
    }
}
