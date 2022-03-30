//
//  AppViewModel.swift
//  FoodMix
//
//  Created by Yuan on 05/03/2022.
//

import SwiftUI
import Apollo

class AppViewModel: ObservableObject {
    @Published var user: User?
    
    var auth: Bool {
        get {
            return user != nil
        }
    }
    
    private var subNotify: Cancellable?
    private var subAccount: Cancellable?
    
    @Published var show: Bool = false
    
    init() {
        
        
        if UserDefaults.standard.string(forKey: "jsonwebtoken") != nil {
            queryUser {
                self.subNotifyAction()
                self.subAccountAction()
            }
        }
        
    }
    
    func queryUser(success: @escaping () -> Void) -> Void {
        
        Network.shared.apollo.fetch(query: MeQuery()) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.me else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let user = try? JSONDecoder().decode(User.self, from: jsonData) else { break }
                
                self.user = user
                success()
                
                
            case .failure(_):
                break
            
            }
            
        }
        
    }
    
    func subNotifyAction() -> Void {
        
        debugPrint("❌ DEBUG: Sub Notify start....")
        subNotify =  Network.shared.apollo.subscribe(subscription: SubNotifySubscription()) { result in
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.subNotify else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let notify = try? JSONDecoder().decode(Notify.self, from: jsonData) else { break }
                
                Toastify.show(notify.msg, image: "bell", background: notify.success() ? Color("Primary") : Color("Rose"))
                
                
            case .failure(_):
                break
            
            }
            
        }
        
    }
    
    func subAccountAction() -> Void {
        debugPrint("❌ DEBUG: Sub Account start....")
        subAccount = Network.shared.apollo.subscribe(subscription: SubAccountSubscription()) { [weak self] result in
            
            guard let self = self else { return }
            
            switch result {
            
            case .success(let graphQLResult):
                
                if graphQLResult.errors != nil {
                    break
                }
                
                guard let rawData = graphQLResult.data?.subAccount else { break }
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData.jsonObject) else { break }
                
                guard let user = try? JSONDecoder().decode(User.self, from: jsonData) else { break }
                
                
                self.user = user
                
            case .failure(_):
                break
            
            }
            
        }
    }
    
    func onLogout(completion: @escaping () -> Void) -> Void {
        user = nil
        // tắt sub Notify
        subNotify?.cancel()
        subAccount?.cancel()
        // Xoá token
        UserDefaults.standard.removeObject(forKey: "jsonwebtoken")
        
        completion()
    }
    
    func onLogin(token: String, completion: @escaping () -> Void) -> Void {
        UserDefaults.standard.set(token, forKey: "jsonwebtoken")
        queryUser {
            self.subNotifyAction()
            self.subAccountAction()
            completion()
        }
    }
    
}
