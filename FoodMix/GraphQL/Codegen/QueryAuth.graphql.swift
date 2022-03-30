// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Me {
      me {
        __typename
        id
        name
        email
        slug
        avatar
        role
        gender
      }
    }
    """

  public let operationName: String = "Me"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("me", type: .object(Me.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(me: Me? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "me": me.flatMap { (value: Me) -> ResultMap in value.resultMap }])
    }

    public var me: Me? {
      get {
        return (resultMap["me"] as? ResultMap).flatMap { Me(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "me")
      }
    }

    public struct Me: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("role", type: .nonNull(.scalar(String.self))),
          GraphQLField("gender", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, email: String, slug: String, avatar: String? = nil, role: String, gender: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "slug": slug, "avatar": avatar, "role": role, "gender": gender])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var slug: String {
        get {
          return resultMap["slug"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "slug")
        }
      }

      public var avatar: String? {
        get {
          return resultMap["avatar"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var role: String {
        get {
          return resultMap["role"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var gender: Int? {
        get {
          return resultMap["gender"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }
    }
  }
}

public final class GetUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUsers($filter: SortOption!) {
      getUsers(filter: $filter) {
        __typename
        id
        name
        email
        slug
        role
        avatar
        countRecipe
      }
    }
    """

  public let operationName: String = "GetUsers"

  public var filter: SortOption

  public init(filter: SortOption) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getUsers", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetUser.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getUsers: [GetUser?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getUsers": getUsers.map { (value: GetUser?) -> ResultMap? in value.flatMap { (value: GetUser) -> ResultMap in value.resultMap } }])
    }

    public var getUsers: [GetUser?] {
      get {
        return (resultMap["getUsers"] as! [ResultMap?]).map { (value: ResultMap?) -> GetUser? in value.flatMap { (value: ResultMap) -> GetUser in GetUser(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetUser?) -> ResultMap? in value.flatMap { (value: GetUser) -> ResultMap in value.resultMap } }, forKey: "getUsers")
      }
    }

    public struct GetUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("role", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("countRecipe", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, email: String, slug: String, role: String, avatar: String? = nil, countRecipe: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "slug": slug, "role": role, "avatar": avatar, "countRecipe": countRecipe])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var email: String {
        get {
          return resultMap["email"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var slug: String {
        get {
          return resultMap["slug"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "slug")
        }
      }

      public var role: String {
        get {
          return resultMap["role"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var avatar: String? {
        get {
          return resultMap["avatar"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var countRecipe: Int? {
        get {
          return resultMap["countRecipe"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "countRecipe")
        }
      }
    }
  }
}

public final class SubAccountSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription SubAccount {
      subAccount {
        __typename
        id
        name
        slug
        gender
        role
        avatar
        banner
        province
        about
        countRecipe
        countRating
        totalRating
      }
    }
    """

  public let operationName: String = "SubAccount"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subAccount", type: .nonNull(.object(SubAccount.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subAccount: SubAccount) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "subAccount": subAccount.resultMap])
    }

    public var subAccount: SubAccount {
      get {
        return SubAccount(unsafeResultMap: resultMap["subAccount"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "subAccount")
      }
    }

    public struct SubAccount: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("gender", type: .scalar(Int.self)),
          GraphQLField("role", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("banner", type: .scalar(String.self)),
          GraphQLField("province", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("countRecipe", type: .scalar(Int.self)),
          GraphQLField("countRating", type: .scalar(Int.self)),
          GraphQLField("totalRating", type: .scalar(Int.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, gender: Int? = nil, role: String, avatar: String? = nil, banner: String? = nil, province: String? = nil, about: String? = nil, countRecipe: Int? = nil, countRating: Int? = nil, totalRating: Int? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "slug": slug, "gender": gender, "role": role, "avatar": avatar, "banner": banner, "province": province, "about": about, "countRecipe": countRecipe, "countRating": countRating, "totalRating": totalRating])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var slug: String {
        get {
          return resultMap["slug"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "slug")
        }
      }

      public var gender: Int? {
        get {
          return resultMap["gender"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var role: String {
        get {
          return resultMap["role"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "role")
        }
      }

      public var avatar: String? {
        get {
          return resultMap["avatar"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var banner: String? {
        get {
          return resultMap["banner"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "banner")
        }
      }

      public var province: String? {
        get {
          return resultMap["province"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "province")
        }
      }

      public var about: String? {
        get {
          return resultMap["about"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "about")
        }
      }

      public var countRecipe: Int? {
        get {
          return resultMap["countRecipe"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "countRecipe")
        }
      }

      public var countRating: Int? {
        get {
          return resultMap["countRating"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "countRating")
        }
      }

      public var totalRating: Int? {
        get {
          return resultMap["totalRating"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalRating")
        }
      }
    }
  }
}
