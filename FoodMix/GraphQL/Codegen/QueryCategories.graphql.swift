// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllCategoriesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllCategories {
      getAllCategories {
        __typename
        id
        name
        slug
        avatar
        content
        icon
      }
    }
    """

  public let operationName: String = "GetAllCategories"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getAllCategories", type: .nonNull(.list(.object(GetAllCategory.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllCategories: [GetAllCategory?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllCategories": getAllCategories.map { (value: GetAllCategory?) -> ResultMap? in value.flatMap { (value: GetAllCategory) -> ResultMap in value.resultMap } }])
    }

    public var getAllCategories: [GetAllCategory?] {
      get {
        return (resultMap["getAllCategories"] as! [ResultMap?]).map { (value: ResultMap?) -> GetAllCategory? in value.flatMap { (value: ResultMap) -> GetAllCategory in GetAllCategory(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetAllCategory?) -> ResultMap? in value.flatMap { (value: GetAllCategory) -> ResultMap in value.resultMap } }, forKey: "getAllCategories")
      }
    }

    public struct GetAllCategory: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Category"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("icon", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, avatar: String, content: String, icon: String) {
        self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name, "slug": slug, "avatar": avatar, "content": content, "icon": icon])
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

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var icon: String {
        get {
          return resultMap["icon"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "icon")
        }
      }
    }
  }
}

public final class GetRecipesByCategoryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetRecipesByCategory($slug: String!, $filter: SortOption!) {
      getRecipesByCategory(slug: $slug, filter: $filter) {
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

  public let operationName: String = "GetRecipesByCategory"

  public var slug: String
  public var filter: SortOption

  public init(slug: String, filter: SortOption) {
    self.slug = slug
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["slug": slug, "filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getRecipesByCategory", arguments: ["slug": GraphQLVariable("slug"), "filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetRecipesByCategory.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getRecipesByCategory: [GetRecipesByCategory?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getRecipesByCategory": getRecipesByCategory.map { (value: GetRecipesByCategory?) -> ResultMap? in value.flatMap { (value: GetRecipesByCategory) -> ResultMap in value.resultMap } }])
    }

    public var getRecipesByCategory: [GetRecipesByCategory?] {
      get {
        return (resultMap["getRecipesByCategory"] as! [ResultMap?]).map { (value: ResultMap?) -> GetRecipesByCategory? in value.flatMap { (value: ResultMap) -> GetRecipesByCategory in GetRecipesByCategory(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetRecipesByCategory?) -> ResultMap? in value.flatMap { (value: GetRecipesByCategory) -> ResultMap in value.resultMap } }, forKey: "getRecipesByCategory")
      }
    }

    public struct GetRecipesByCategory: GraphQLSelectionSet {
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

public final class CategoryToRecipesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CategoryToRecipes($slug: String!, $filter: SortOption!) {
      getRecipesByCategory(slug: $slug, filter: $filter) {
        __typename
        id
        name
        slug
        avatar
        content
        totalRating
        countRating
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

  public let operationName: String = "CategoryToRecipes"

  public var slug: String
  public var filter: SortOption

  public init(slug: String, filter: SortOption) {
    self.slug = slug
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["slug": slug, "filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getRecipesByCategory", arguments: ["slug": GraphQLVariable("slug"), "filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetRecipesByCategory.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getRecipesByCategory: [GetRecipesByCategory?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getRecipesByCategory": getRecipesByCategory.map { (value: GetRecipesByCategory?) -> ResultMap? in value.flatMap { (value: GetRecipesByCategory) -> ResultMap in value.resultMap } }])
    }

    public var getRecipesByCategory: [GetRecipesByCategory?] {
      get {
        return (resultMap["getRecipesByCategory"] as! [ResultMap?]).map { (value: ResultMap?) -> GetRecipesByCategory? in value.flatMap { (value: ResultMap) -> GetRecipesByCategory in GetRecipesByCategory(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetRecipesByCategory?) -> ResultMap? in value.flatMap { (value: GetRecipesByCategory) -> ResultMap in value.resultMap } }, forKey: "getRecipesByCategory")
      }
    }

    public struct GetRecipesByCategory: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Recipe"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("totalRating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("countRating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("user", type: .object(User.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, avatar: String, content: String, totalRating: Int, countRating: Int, user: User? = nil) {
        self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "name": name, "slug": slug, "avatar": avatar, "content": content, "totalRating": totalRating, "countRating": countRating, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }])
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

      public var countRating: Int {
        get {
          return resultMap["countRating"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "countRating")
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
