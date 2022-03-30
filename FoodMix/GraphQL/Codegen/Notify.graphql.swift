// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class SubNotifySubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription SubNotify {
      subNotify {
        __typename
        error
        msg
        user {
          __typename
          id
          name
          avatar
          slug
          role
        }
      }
    }
    """

  public let operationName: String = "SubNotify"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subNotify", type: .object(SubNotify.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subNotify: SubNotify? = nil) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "subNotify": subNotify.flatMap { (value: SubNotify) -> ResultMap in value.resultMap }])
    }

    public var subNotify: SubNotify? {
      get {
        return (resultMap["subNotify"] as? ResultMap).flatMap { SubNotify(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "subNotify")
      }
    }

    public struct SubNotify: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Notify"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("error", type: .scalar(Bool.self)),
          GraphQLField("msg", type: .nonNull(.scalar(String.self))),
          GraphQLField("user", type: .nonNull(.object(User.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(error: Bool? = nil, msg: String, user: User) {
        self.init(unsafeResultMap: ["__typename": "Notify", "error": error, "msg": msg, "user": user.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var error: Bool? {
        get {
          return resultMap["error"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public var msg: String {
        get {
          return resultMap["msg"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "msg")
        }
      }

      public var user: User {
        get {
          return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "user")
        }
      }

      public struct User: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["User"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("avatar", type: .scalar(String.self)),
            GraphQLField("slug", type: .nonNull(.scalar(String.self))),
            GraphQLField("role", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, avatar: String? = nil, slug: String, role: String) {
          self.init(unsafeResultMap: ["__typename": "User", "id": id, "name": name, "avatar": avatar, "slug": slug, "role": role])
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

        public var avatar: String? {
          get {
            return resultMap["avatar"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "avatar")
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
      }
    }
  }
}
