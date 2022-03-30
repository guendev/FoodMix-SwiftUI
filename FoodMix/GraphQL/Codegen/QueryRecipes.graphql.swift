// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetRecipeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetRecipe($id: String!) {
      getRecipe(id: $id) {
        __typename
        id
        name
        slug
        avatar
        content
        category {
          __typename
          id
          name
          slug
          icon
        }
        user {
          __typename
          id
          name
          email
          slug
          avatar
          countRecipe
        }
        ingredients {
          __typename
          name
          count
          unit
        }
        stepper {
          __typename
          name
          content
          image
        }
        time
        preparation
        views
        countRating
        totalRating
      }
    }
    """

  public let operationName: String = "GetRecipe"

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
        GraphQLField("getRecipe", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(GetRecipe.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getRecipe: GetRecipe) {
      self.init(unsafeResultMap: ["__typename": "Query", "getRecipe": getRecipe.resultMap])
    }

    public var getRecipe: GetRecipe {
      get {
        return GetRecipe(unsafeResultMap: resultMap["getRecipe"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getRecipe")
      }
    }

    public struct GetRecipe: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Recipe"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
          GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          GraphQLField("avatar", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("category", type: .object(Category.selections)),
          GraphQLField("user", type: .object(User.selections)),
          GraphQLField("ingredients", type: .list(.object(Ingredient.selections))),
          GraphQLField("stepper", type: .list(.object(Stepper.selections))),
          GraphQLField("time", type: .nonNull(.scalar(String.self))),
          GraphQLField("preparation", type: .nonNull(.scalar(String.self))),
          GraphQLField("views", type: .nonNull(.scalar(Int.self))),
          GraphQLField("countRating", type: .nonNull(.scalar(Int.self))),
          GraphQLField("totalRating", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, avatar: String, content: String, category: Category? = nil, user: User? = nil, ingredients: [Ingredient?]? = nil, stepper: [Stepper?]? = nil, time: String, preparation: String, views: Int, countRating: Int, totalRating: Int) {
        self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "name": name, "slug": slug, "avatar": avatar, "content": content, "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "ingredients": ingredients.flatMap { (value: [Ingredient?]) -> [ResultMap?] in value.map { (value: Ingredient?) -> ResultMap? in value.flatMap { (value: Ingredient) -> ResultMap in value.resultMap } } }, "stepper": stepper.flatMap { (value: [Stepper?]) -> [ResultMap?] in value.map { (value: Stepper?) -> ResultMap? in value.flatMap { (value: Stepper) -> ResultMap in value.resultMap } } }, "time": time, "preparation": preparation, "views": views, "countRating": countRating, "totalRating": totalRating])
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

      public var category: Category? {
        get {
          return (resultMap["category"] as? ResultMap).flatMap { Category(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "category")
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

      public var ingredients: [Ingredient?]? {
        get {
          return (resultMap["ingredients"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Ingredient?] in value.map { (value: ResultMap?) -> Ingredient? in value.flatMap { (value: ResultMap) -> Ingredient in Ingredient(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Ingredient?]) -> [ResultMap?] in value.map { (value: Ingredient?) -> ResultMap? in value.flatMap { (value: Ingredient) -> ResultMap in value.resultMap } } }, forKey: "ingredients")
        }
      }

      public var stepper: [Stepper?]? {
        get {
          return (resultMap["stepper"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Stepper?] in value.map { (value: ResultMap?) -> Stepper? in value.flatMap { (value: ResultMap) -> Stepper in Stepper(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Stepper?]) -> [ResultMap?] in value.map { (value: Stepper?) -> ResultMap? in value.flatMap { (value: Stepper) -> ResultMap in value.resultMap } } }, forKey: "stepper")
        }
      }

      public var time: String {
        get {
          return resultMap["time"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "time")
        }
      }

      public var preparation: String {
        get {
          return resultMap["preparation"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "preparation")
        }
      }

      public var views: Int {
        get {
          return resultMap["views"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "views")
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

      public struct Category: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Category"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
            GraphQLField("icon", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, slug: String, icon: String) {
          self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name, "slug": slug, "icon": icon])
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

        public var icon: String {
          get {
            return resultMap["icon"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "icon")
          }
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
            GraphQLField("countRecipe", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, email: String, slug: String, avatar: String? = nil, countRecipe: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "email": email, "slug": slug, "avatar": avatar, "countRecipe": countRecipe])
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

        public var countRecipe: Int? {
          get {
            return resultMap["countRecipe"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "countRecipe")
          }
        }
      }

      public struct Ingredient: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Ingredient"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
            GraphQLField("unit", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, count: Int, unit: String) {
          self.init(unsafeResultMap: ["__typename": "Ingredient", "name": name, "count": count, "unit": unit])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        public var unit: String {
          get {
            return resultMap["unit"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "unit")
          }
        }
      }

      public struct Stepper: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Stepper"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("content", type: .nonNull(.scalar(String.self))),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, content: String, image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Stepper", "name": name, "content": content, "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var content: String {
          get {
            return resultMap["content"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "content")
          }
        }

        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class HomeUpdatedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HomeUpdated($filter: SortOption!) {
      getRecipes(filter: $filter) {
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

  public let operationName: String = "HomeUpdated"

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
        GraphQLField("getRecipes", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetRecipe.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getRecipes: [GetRecipe?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getRecipes": getRecipes.map { (value: GetRecipe?) -> ResultMap? in value.flatMap { (value: GetRecipe) -> ResultMap in value.resultMap } }])
    }

    public var getRecipes: [GetRecipe?] {
      get {
        return (resultMap["getRecipes"] as! [ResultMap?]).map { (value: ResultMap?) -> GetRecipe? in value.flatMap { (value: ResultMap) -> GetRecipe in GetRecipe(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetRecipe?) -> ResultMap? in value.flatMap { (value: GetRecipe) -> ResultMap in value.resultMap } }, forKey: "getRecipes")
      }
    }

    public struct GetRecipe: GraphQLSelectionSet {
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

public final class CheckBookmarkQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query CheckBookmark($id: String!) {
      checkBookmark(id: $id) {
        __typename
        id
        createdAt
      }
    }
    """

  public let operationName: String = "CheckBookmark"

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
        GraphQLField("checkBookmark", arguments: ["id": GraphQLVariable("id")], type: .object(CheckBookmark.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(checkBookmark: CheckBookmark? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "checkBookmark": checkBookmark.flatMap { (value: CheckBookmark) -> ResultMap in value.resultMap }])
    }

    public var checkBookmark: CheckBookmark? {
      get {
        return (resultMap["checkBookmark"] as? ResultMap).flatMap { CheckBookmark(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "checkBookmark")
      }
    }

    public struct CheckBookmark: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Bookmark"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdAt", type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdAt: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "Bookmark", "id": id, "createdAt": createdAt])
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

      public var createdAt: Double? {
        get {
          return resultMap["createdAt"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdAt")
        }
      }
    }
  }
}

public final class GetSearchRecipesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetSearchRecipes($filter: SearchRecipeFilter!) {
      getSearchRecipes(filter: $filter) {
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
        category {
          __typename
          id
          name
          slug
        }
      }
    }
    """

  public let operationName: String = "GetSearchRecipes"

  public var filter: SearchRecipeFilter

  public init(filter: SearchRecipeFilter) {
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getSearchRecipes", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetSearchRecipe.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getSearchRecipes: [GetSearchRecipe?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getSearchRecipes": getSearchRecipes.map { (value: GetSearchRecipe?) -> ResultMap? in value.flatMap { (value: GetSearchRecipe) -> ResultMap in value.resultMap } }])
    }

    public var getSearchRecipes: [GetSearchRecipe?] {
      get {
        return (resultMap["getSearchRecipes"] as! [ResultMap?]).map { (value: ResultMap?) -> GetSearchRecipe? in value.flatMap { (value: ResultMap) -> GetSearchRecipe in GetSearchRecipe(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetSearchRecipe?) -> ResultMap? in value.flatMap { (value: GetSearchRecipe) -> ResultMap in value.resultMap } }, forKey: "getSearchRecipes")
      }
    }

    public struct GetSearchRecipe: GraphQLSelectionSet {
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
          GraphQLField("category", type: .object(Category.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, avatar: String, content: String, totalRating: Int, countRating: Int, user: User? = nil, category: Category? = nil) {
        self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "name": name, "slug": slug, "avatar": avatar, "content": content, "totalRating": totalRating, "countRating": countRating, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }])
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

      public var category: Category? {
        get {
          return (resultMap["category"] as? ResultMap).flatMap { Category(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "category")
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

      public struct Category: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Category"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, slug: String) {
          self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name, "slug": slug])
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
      }
    }
  }
}

public final class GetSearchRecipesByIngredientQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetSearchRecipesByIngredient($name: String!, $filter: SortOption!) {
      getSearchRecipesByIngredient(name: $name, filter: $filter) {
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

  public let operationName: String = "GetSearchRecipesByIngredient"

  public var name: String
  public var filter: SortOption

  public init(name: String, filter: SortOption) {
    self.name = name
    self.filter = filter
  }

  public var variables: GraphQLMap? {
    return ["name": name, "filter": filter]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getSearchRecipesByIngredient", arguments: ["name": GraphQLVariable("name"), "filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetSearchRecipesByIngredient.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getSearchRecipesByIngredient: [GetSearchRecipesByIngredient?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getSearchRecipesByIngredient": getSearchRecipesByIngredient.map { (value: GetSearchRecipesByIngredient?) -> ResultMap? in value.flatMap { (value: GetSearchRecipesByIngredient) -> ResultMap in value.resultMap } }])
    }

    /// Tìm món ăn theo nguyên liệu
    public var getSearchRecipesByIngredient: [GetSearchRecipesByIngredient?] {
      get {
        return (resultMap["getSearchRecipesByIngredient"] as! [ResultMap?]).map { (value: ResultMap?) -> GetSearchRecipesByIngredient? in value.flatMap { (value: ResultMap) -> GetSearchRecipesByIngredient in GetSearchRecipesByIngredient(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetSearchRecipesByIngredient?) -> ResultMap? in value.flatMap { (value: GetSearchRecipesByIngredient) -> ResultMap in value.resultMap } }, forKey: "getSearchRecipesByIngredient")
      }
    }

    public struct GetSearchRecipesByIngredient: GraphQLSelectionSet {
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

public final class SubRecipeSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription SubRecipe($id: String!) {
      subRecipe(id: $id) {
        __typename
        id
        name
        slug
        avatar
        content
        totalRating
        countRating
      }
    }
    """

  public let operationName: String = "SubRecipe"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subRecipe", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(SubRecipe.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subRecipe: SubRecipe) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "subRecipe": subRecipe.resultMap])
    }

    /// Slug món ăn
    public var subRecipe: SubRecipe {
      get {
        return SubRecipe(unsafeResultMap: resultMap["subRecipe"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "subRecipe")
      }
    }

    public struct SubRecipe: GraphQLSelectionSet {
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
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, avatar: String, content: String, totalRating: Int, countRating: Int) {
        self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "name": name, "slug": slug, "avatar": avatar, "content": content, "totalRating": totalRating, "countRating": countRating])
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
    }
  }
}

public final class GetRandomRecipesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetRandomRecipes($size: Int!) {
      getRandomRecipes(size: $size) {
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
        category {
          __typename
          id
          name
          slug
        }
      }
    }
    """

  public let operationName: String = "GetRandomRecipes"

  public var size: Int

  public init(size: Int) {
    self.size = size
  }

  public var variables: GraphQLMap? {
    return ["size": size]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getRandomRecipes", arguments: ["size": GraphQLVariable("size")], type: .nonNull(.list(.object(GetRandomRecipe.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getRandomRecipes: [GetRandomRecipe?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getRandomRecipes": getRandomRecipes.map { (value: GetRandomRecipe?) -> ResultMap? in value.flatMap { (value: GetRandomRecipe) -> ResultMap in value.resultMap } }])
    }

    /// Random recope
    public var getRandomRecipes: [GetRandomRecipe?] {
      get {
        return (resultMap["getRandomRecipes"] as! [ResultMap?]).map { (value: ResultMap?) -> GetRandomRecipe? in value.flatMap { (value: ResultMap) -> GetRandomRecipe in GetRandomRecipe(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetRandomRecipe?) -> ResultMap? in value.flatMap { (value: GetRandomRecipe) -> ResultMap in value.resultMap } }, forKey: "getRandomRecipes")
      }
    }

    public struct GetRandomRecipe: GraphQLSelectionSet {
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
          GraphQLField("category", type: .object(Category.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String, slug: String, avatar: String, content: String, totalRating: Int, countRating: Int, user: User? = nil, category: Category? = nil) {
        self.init(unsafeResultMap: ["__typename": "Recipe", "id": id, "name": name, "slug": slug, "avatar": avatar, "content": content, "totalRating": totalRating, "countRating": countRating, "user": user.flatMap { (value: User) -> ResultMap in value.resultMap }, "category": category.flatMap { (value: Category) -> ResultMap in value.resultMap }])
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

      public var category: Category? {
        get {
          return (resultMap["category"] as? ResultMap).flatMap { Category(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "category")
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

      public struct Category: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Category"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, slug: String) {
          self.init(unsafeResultMap: ["__typename": "Category", "id": id, "name": name, "slug": slug])
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
      }
    }
  }
}
