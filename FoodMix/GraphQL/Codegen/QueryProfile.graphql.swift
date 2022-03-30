// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetReviewsProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetReviewsProfile($id: String!, $filter: SortOption!) {
      getReviewsProfile(id: $id, filter: $filter) {
        __typename
        id
        user {
          __typename
          id
          name
          email
          slug
          avatar
        }
        content
        totalRating
        createdAt
        recipe {
          __typename
          id
          name
          slug
          avatar
          countRating
          totalRating
        }
      }
    }
    """

  public let operationName: String = "GetReviewsProfile"

  public var id: String
  public var filter: SortOption

  public init(id: String, filter: SortOption) {
    self.id = id
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["id": id, "filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getReviewsProfile", arguments: ["id": GraphQLVariable("id"), "filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetReviewsProfile.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getReviewsProfile: [GetReviewsProfile?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getReviewsProfile": getReviewsProfile.map { (value: GetReviewsProfile?) -> ResultMap? in value.flatMap { (value: GetReviewsProfile) -> ResultMap in value.resultMap } }])
    }

    public var getReviewsProfile: [GetReviewsProfile?] {
      get {
        return (resultMap["getReviewsProfile"] as! [ResultMap?]).map { (value: ResultMap?) -> GetReviewsProfile? in value.flatMap { (value: ResultMap) -> GetReviewsProfile in GetReviewsProfile(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetReviewsProfile?) -> ResultMap? in value.flatMap { (value: GetReviewsProfile) -> ResultMap in value.resultMap } }, forKey: "getReviewsProfile")
      }
    }

    public struct GetReviewsProfile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Review"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("user", type: .object(User.selections)),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalRating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("createdAt", type: .nonNull(.scalar(Double.self))),
          GraphQLField("recipe", type: .object(Recipe.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, user: User? = nil, content: String, totalRating: Int, createdAt: Double, recipe: Recipe? = nil) {
        self.init(unsafeResultMap: ["__typename": "Review", "id": id, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "content": content, "totalRating": totalRating, "createdAt": createdAt, "recipe": recipe.flatMap { (value: Recipe) -> ResultMap in value.resultMap }])
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

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var totalRating: Int {
        get {
          return resultMap["totalRating"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalRating")
        }
      }

      public var createdAt: Double {
        get {
          return resultMap["createdAt"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }

      public var recipe: Recipe? {
        get {
          return (resultMap["recipe"] as? ResultMap).flatMap { Recipe(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "recipe")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("email", type: .nonNull(.scalar(String.self))),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, email: String, slug: String, avatar: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "slug": slug, "avatar": avatar])
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
      }

      public struct Recipe: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Recipe"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
            GraphQLField("countRating", type: .nonNull(.scalar(Int.self))),
            GraphQLField("totalRating", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, slug: String, avatar: String, countRating: Int, totalRating: Int) {
          self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "name": name, "slug": slug, "avatar": avatar, "countRating": countRating, "totalRating": totalRating])
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

        public var avatar: String {
          get {
            return resultMap["avatar"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatar")
          }
        }

        public var countRating: Int {
          get {
            return resultMap["countRating"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "countRating")
          }
        }

        public var totalRating: Int {
          get {
            return resultMap["totalRating"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalRating")
          }
        }
      }
    }
  }
}

public final class GetProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetProfile($id: String!) {
      getProfile(id: $id) {
        __typename
        id
        name
        email
        slug
        avatar
        banner
        province
        about
        countRecipe
        countRating
        totalRating
        createdAt
      }
    }
    """

  public let operationName: String = "GetProfile"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getProfile", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(GetProfile.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getProfile: GetProfile) {
      self.init(unsafeResultMap: ["__typename": "Query", "getProfile": getProfile.resultMap])
    }

    public var getProfile: GetProfile {
      get {
        return GetProfile(unsafeResultMap: resultMap["getProfile"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getProfile")
      }
    }

    public struct GetProfile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("email", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .scalar(String.self)),
          GraphQLField("banner", type: .scalar(String.self)),
          GraphQLField("province", type: .scalar(String.self)),
          GraphQLField("about", type: .scalar(String.self)),
          GraphQLField("countRecipe", type: .scalar(Int.self)),
          GraphQLField("countRating", type: .scalar(Int.self)),
          GraphQLField("totalRating", type: .scalar(Int.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, email: String, slug: String, avatar: String? = nil, banner: String? = nil, province: String? = nil, about: String? = nil, countRecipe: Int? = nil, countRating: Int? = nil, totalRating: Int? = nil, createdAt: Double) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "slug": slug, "avatar": avatar, "banner": banner, "province": province, "about": about, "countRecipe": countRecipe, "countRating": countRating, "totalRating": totalRating, "createdAt": createdAt])
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

      public var createdAt: Double {
        get {
          return resultMap["createdAt"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }
    }
  }
}

public final class GetRecipesProfileQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetRecipesProfile($id: String!, $filter: SortOption!) {
      getRecipesProfile(id: $id, filter: $filter) {
        __typename
        id
        name
        slug
        avatar
        countRating
        totalRating
        user {
          __typename
          id
          name
          slug
          avatar
        }
      }
    }
    """

  public let operationName: String = "GetRecipesProfile"

  public var id: String
  public var filter: SortOption

  public init(id: String, filter: SortOption) {
    self.id = id
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["id": id, "filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getRecipesProfile", arguments: ["id": GraphQLVariable("id"), "filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetRecipesProfile.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getRecipesProfile: [GetRecipesProfile?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getRecipesProfile": getRecipesProfile.map { (value: GetRecipesProfile?) -> ResultMap? in value.flatMap { (value: GetRecipesProfile) -> ResultMap in value.resultMap } }])
    }

    public var getRecipesProfile: [GetRecipesProfile?] {
      get {
        return (resultMap["getRecipesProfile"] as! [ResultMap?]).map { (value: ResultMap?) -> GetRecipesProfile? in value.flatMap { (value: ResultMap) -> GetRecipesProfile in GetRecipesProfile(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetRecipesProfile?) -> ResultMap? in value.flatMap { (value: GetRecipesProfile) -> ResultMap in value.resultMap } }, forKey: "getRecipesProfile")
      }
    }

    public struct GetRecipesProfile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Recipe"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
          GraphQLField("countRating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("totalRating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, avatar: String, countRating: Int, totalRating: Int, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "name": name, "slug": slug, "avatar": avatar, "countRating": countRating, "totalRating": totalRating, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

      public var avatar: String {
        get {
          return resultMap["avatar"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "avatar")
        }
      }

      public var countRating: Int {
        get {
          return resultMap["countRating"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "countRating")
        }
      }

      public var totalRating: Int {
        get {
          return resultMap["totalRating"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "totalRating")
        }
      }

      public var user: User? {
        get {
          return (resultMap["user"] as? ResultMap).flatMap { User(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, slug: String, avatar: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "slug": slug, "avatar": avatar])
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

        public var avatar: String? {
          get {
            return resultMap["avatar"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatar")
          }
        }
      }
    }
  }
}
