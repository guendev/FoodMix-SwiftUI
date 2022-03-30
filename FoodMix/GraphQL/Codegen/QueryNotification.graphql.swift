// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetNotificationsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetNotifications($filter: SortOption!) {
      getNotifications(filter: $filter) {
        __typename
        id
        icon
        title
        content
        readAt
        createdAt
        sender {
          __typename
          id
          name
          email
          slug
          avatar
        }
      }
    }
    """

  public let operationName: String = "GetNotifications"

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
        GraphQLField("getNotifications", arguments: ["filter": GraphQLVariable("filter")], type: .nonNull(.list(.object(GetNotification.selections)))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getNotifications: [GetNotification?]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getNotifications": getNotifications.map { (value: GetNotification?) -> ResultMap? in value.flatMap { (value: GetNotification) -> ResultMap in value.resultMap } }])
    }

    public var getNotifications: [GetNotification?] {
      get {
        return (resultMap["getNotifications"] as! [ResultMap?]).map { (value: ResultMap?) -> GetNotification? in value.flatMap { (value: ResultMap) -> GetNotification in GetNotification(unsafeResultMap: value) } }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetNotification?) -> ResultMap? in value.flatMap { (value: GetNotification) -> ResultMap in value.resultMap } }, forKey: "getNotifications")
      }
    }

    public struct GetNotification: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Notification"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("icon", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("readAt", type: .scalar(Double.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(Double.self))),
          GraphQLField("sender", type: .object(Sender.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, icon: String, title: String, content: String, readAt: Double? = nil, createdAt: Double, sender: Sender? = nil) {
        self.init(unsafeResultMap: ["__typename": "Notification", "id": id, "icon": icon, "title": title, "content": content, "readAt": readAt, "createdAt": createdAt, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }])
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

      public var icon: String {
        get {
          return resultMap["icon"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "icon")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
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

      public var readAt: Double? {
        get {
          return resultMap["readAt"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "readAt")
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

      public var sender: Sender? {
        get {
          return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "sender")
        }
      }

      public struct Sender: GraphQLSelectionSet {
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
    }
  }
}

public final class ReadNoticationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ReadNotication($id: String) {
      readNotication(id: $id) {
        __typename
        id
        readAt
      }
    }
    """

  public let operationName: String = "ReadNotication"

  public var id: String?

  public init(id: String? = nil) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("readNotication", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(ReadNotication.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(readNotication: ReadNotication) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "readNotication": readNotication.resultMap])
    }

    public var readNotication: ReadNotication {
      get {
        return ReadNotication(unsafeResultMap: resultMap["readNotication"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "readNotication")
      }
    }

    public struct ReadNotication: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Notification"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("readAt", type: .scalar(Double.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, readAt: Double? = nil) {
        self.init(unsafeResultMap: ["__typename": "Notification", "id": id, "readAt": readAt])
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

      public var readAt: Double? {
        get {
          return resultMap["readAt"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "readAt")
        }
      }
    }
  }
}

public final class SubNotificationSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription SubNotification {
      subNotification {
        __typename
        id
        sender {
          __typename
          id
          name
          email
          slug
          avatar
        }
        icon
        title
        content
        readAt
        createdAt
      }
    }
    """

  public let operationName: String = "SubNotification"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("subNotification", type: .nonNull(.object(SubNotification.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(subNotification: SubNotification) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "subNotification": subNotification.resultMap])
    }

    public var subNotification: SubNotification {
      get {
        return SubNotification(unsafeResultMap: resultMap["subNotification"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "subNotification")
      }
    }

    public struct SubNotification: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Notification"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sender", type: .object(Sender.selections)),
          GraphQLField("icon", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("readAt", type: .scalar(Double.self)),
          GraphQLField("createdAt", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, sender: Sender? = nil, icon: String, title: String, content: String, readAt: Double? = nil, createdAt: Double) {
        self.init(unsafeResultMap: ["__typename": "Notification", "id": id, "sender": sender.flatMap { (value: Sender) -> ResultMap in value.resultMap }, "icon": icon, "title": title, "content": content, "readAt": readAt, "createdAt": createdAt])
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

      public var sender: Sender? {
        get {
          return (resultMap["sender"] as? ResultMap).flatMap { Sender(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "sender")
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

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
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

      public var readAt: Double? {
        get {
          return resultMap["readAt"] as? Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "readAt")
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

      public struct Sender: GraphQLSelectionSet {
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
    }
  }
}
