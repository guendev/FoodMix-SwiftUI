//
//  FoodMixServices.swift
//  FoodMix
//
//  Created by Yuan on 12/03/2022.
//

import Moya
import Foundation
import UIKit

struct FoodMixNetworkManager {
    
    static let shared = FoodMixNetworkManager()
    
    private let provider = MoyaProvider<FoodMixService>()
    
    private init() {}
    
    func uploadSingle(endpoint: String, image: UIImage, success: @escaping (_ data: FoodMixResponse) -> Void) -> Void {
        
        provider.request(.uploadSingle(endpoint: endpoint, image: image)) { result in
            
            switch result {
            case .success(let response):
                            
                guard let jsonObject = try? response.mapJSON() else { break }
                
                let rawData = jsonObject as! [String: Any]
                
                let data: FoodMixResponse = FoodMixResponse(fromJson: rawData)
                
                success(data)
                
                
            break
            case .failure(let error):
                    print("Failure: \(error)")
            break
            }
            
        }
        
    }
    
}

enum FoodMixService {
    
    case uploadSingle(endpoint: String, image: UIImage)
    
}

extension FoodMixService: TargetType {
    
    var jsonWebToken: String {
        
        get {
            return UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
        }
        
    }
    
    var baseURL: URL {
        return URL(string: "http://localhost:3000")!
    }
    
    var path: String {
        
        switch self {
            case .uploadSingle:
                return "/api/upload/single"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
            case .uploadSingle:
                return .post
        }
    }
    
    // 4
    var sampleData: Data {
        return Data()
    }

     // 5
    var task: Task {
        switch self {
            case .uploadSingle(let endpoint, let image):
            
                let imageData = image.jpegData(compressionQuality: 0.7)
                let endpointData = "\(endpoint)".data(using: String.Encoding.utf8) ?? Data()
                
                var formData: [Moya.MultipartFormData] = [Moya.MultipartFormData(provider: .data(imageData!), name: "image", fileName: "image.jpeg", mimeType: "image/jpeg")]
                formData.append(Moya.MultipartFormData(provider: .data(endpointData), name: "endpoint"))
                return .uploadMultipart(formData)
        }
    }

     // 6
    var headers: [String: String]? {
        return [
                "Content-Type": "application/json",
                "Authorization": "Bearer \(jsonWebToken)"
            ]
            
    }
    
    // 7
    var validationType: ValidationType {
       return .successCodes
     }
}

struct FoodMixResponse: Identifiable {
    
    typealias ResponseData = [String: Any]
    
    var id = UUID().uuidString
    var data: Any
    var msg: String?
    var code: Int?
    
    init(fromJson raw: ResponseData) {
        
        self.data = raw["data"] as Any
        self.msg = raw["msg"] as? String ?? ""
        self.code = raw["code"] as? Int ?? 0
        
    }
}
