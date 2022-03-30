//
//  AccountViewModel.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI
import PhotosUI


class AccountViewModel: ObservableObject {
    
    
    @Published var provinces: [Province] = [Province]()
    
    @Published var loadingAvatar: Bool = false
    @Published var loadingBanner: Bool = false
    @Published var loadingUpdateInfo: Bool = false
    @Published var loadingUpdatePassword: Bool = false
    
    // form Info
    @Published var name: String = ""
    @Published var avatar: String = "https://i.imgur.com/pqGLgGr.jpg"
    @Published var banner: String = ""
    @Published var email: String = ""
    @Published var gender: UserGender = .UnKnown
    @Published var province: String = ""
    @Published var about: String = ""
    
    // Form password
    @Published var currentPassword: String = ""
    @Published var newPassword: String = ""
    @Published var rePassword: String = ""
    
    var provincesMap: [String] {
        get {
            return provinces.map { item in
                return item.name
            }
        }
    }
    
    
    func getProvinces() -> Void {
        
        if !provinces.isEmpty {
            return
        }
        
        guard let rawData = loadJson(forFilename: "provinces") else { return }
        
        for item in rawData {
            guard let jsonData = try? JSONSerialization.data(withJSONObject: item.value) else { break }
            guard let province = try? JSONDecoder().decode(Province.self, from: jsonData) else { break }
            provinces.append(province)
           
        }
        
    }
    
    func pickedAvatar(_ results: [PHPickerResult], endpoint: String) -> Void {
                
        guard let image = results.first?.itemProvider else { return }
        
        if endpoint == "user-avatar" {
            self.loadingAvatar = true
        } else {
            self.loadingBanner = true
        }
        
        if image.canLoadObject(ofClass: UIImage.self) {
            
            image.loadObject(ofClass: UIImage.self) { img, error in
                                
                if let typeCastedImage = img as? UIImage {
                    
                    FoodMixNetworkManager.shared.uploadSingle(endpoint: endpoint, image: typeCastedImage) { [weak self] result in
                        
                        guard let self = self else { return }
                        
                        if endpoint == "user-avatar" {
                            
                            self.loadingAvatar = false
                            self.avatar = result.data as? String ?? ""
                            
                        } else {
                            self.loadingBanner = true
                            self.banner = result.data as? String ?? ""
                        }
                        
                        Toastify.show("Tải Lên Thành Công", image: "bell")
                                                
                    }
                    
                }
                                
            }
            
        }
        
        
    }
    
    func updateUser(success: @escaping (_ user: User) -> Void) -> Void {
        
        loadingUpdateInfo = true
                
        let input: UserUpdateInput = UserUpdateInput(
            name: name,
            avatar: avatar,
            banner: banner,
            about: about,
            province: province,
            gender: "\(gender.rawValue)"
        )
            
        Network.shared.apollo.perform(mutation: UpdateUserMutation(input: input)) { [weak self] result in
            
            guard let self = self else {
                  return
            }
            
            switch result {
            case .success(let graphQLResult) :
                                
                if graphQLResult.errors != nil {
                    break
                }

                // lưu data
                let rawData = graphQLResult.data?.updateUser
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: rawData!.jsonObject) else { break }
                
                guard let user = try? JSONDecoder().decode(User.self, from: jsonData)  else { break }
                                
                success(user)
                break
                
            case .failure(_):
                break                // Lỗi mạng
            }
            
            self.loadingUpdateInfo = false
            
        }
        
        
    }
    
    func updatePassword(success: @escaping () -> Void) -> Void {
        
        loadingUpdatePassword = true
        
        Network.shared.apollo.perform(mutation: UpdateUserPasswordMutation(input: UserUpdatePasswordInput(currentPassword: currentPassword, newPassword: newPassword))) { [weak self] result in
            guard let self = self else {
                  return
            }
            
            switch result {
            case .success(let graphQLResult) :
                                
                if graphQLResult.errors != nil {
                    break
                }
                success()
                break
                
            case .failure(_):
                break                // Lỗi mạng
            }
            
            self.loadingUpdatePassword = false
        }
    }
    
    
}

extension AccountViewModel {
    
    func pickPhotosConfig() -> PHPickerConfiguration {
        
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 1
        configuration.filter = .images
        
        return configuration
    }
    
}
