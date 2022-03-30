// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct SignInInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - email
  ///   - password
  public init(email: String, password: String) {
    graphQLMap = ["email": email, "password": password]
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct SignUpInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - email
  ///   - password
  public init(name: String, email: String, password: String) {
    graphQLMap = ["name": name, "email": email, "password": password]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var email: String {
    get {
      return graphQLMap["email"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var password: String {
    get {
      return graphQLMap["password"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "password")
    }
  }
}

public struct UserUpdateInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - name
  ///   - avatar
  ///   - banner
  ///   - about
  ///   - province
  ///   - gender
  public init(name: String, avatar: String, banner: String, about: Swift.Optional<String?> = nil, province: Swift.Optional<String?> = nil, gender: Swift.Optional<String?> = nil) {
    graphQLMap = ["name": name, "avatar": avatar, "banner": banner, "about": about, "province": province, "gender": gender]
  }

  public var name: String {
    get {
      return graphQLMap["name"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "name")
    }
  }

  public var avatar: String {
    get {
      return graphQLMap["avatar"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "avatar")
    }
  }

  public var banner: String {
    get {
      return graphQLMap["banner"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "banner")
    }
  }

  public var about: Swift.Optional<String?> {
    get {
      return graphQLMap["about"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "about")
    }
  }

  public var province: Swift.Optional<String?> {
    get {
      return graphQLMap["province"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "province")
    }
  }

  public var gender: Swift.Optional<String?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }
}

public struct UserUpdatePasswordInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - currentPassword
  ///   - newPassword
  public init(currentPassword: String, newPassword: String) {
    graphQLMap = ["currentPassword": currentPassword, "newPassword": newPassword]
  }

  public var currentPassword: String {
    get {
      return graphQLMap["currentPassword"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currentPassword")
    }
  }

  public var newPassword: String {
    get {
      return graphQLMap["newPassword"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "newPassword")
    }
  }
}

public struct AddReviewInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - content
  ///   - totalRating
  public init(content: String, totalRating: String) {
    graphQLMap = ["content": content, "totalRating": totalRating]
  }

  public var content: String {
    get {
      return graphQLMap["content"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "content")
    }
  }

  public var totalRating: String {
    get {
      return graphQLMap["totalRating"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "totalRating")
    }
  }
}

public struct SortOption: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - sort
  ///   - page
  ///   - limit
  public init(sort: Swift.Optional<String?> = nil, page: String, limit: String) {
    graphQLMap = ["sort": sort, "page": page, "limit": limit]
  }

  public var sort: Swift.Optional<String?> {
    get {
      return graphQLMap["sort"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "sort")
    }
  }

  public var page: String {
    get {
      return graphQLMap["page"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "page")
    }
  }

  public var limit: String {
    get {
      return graphQLMap["limit"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }
}

public struct SearchRecipeFilter: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - keyword
  ///   - category
  ///   - page
  ///   - limit
  public init(keyword: Swift.Optional<String?> = nil, category: Swift.Optional<String?> = nil, page: String, limit: String) {
    graphQLMap = ["keyword": keyword, "category": category, "page": page, "limit": limit]
  }

  public var keyword: Swift.Optional<String?> {
    get {
      return graphQLMap["keyword"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "keyword")
    }
  }

  public var category: Swift.Optional<String?> {
    get {
      return graphQLMap["category"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "category")
    }
  }

  public var page: String {
    get {
      return graphQLMap["page"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "page")
    }
  }

  public var limit: String {
    get {
      return graphQLMap["limit"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }
}
