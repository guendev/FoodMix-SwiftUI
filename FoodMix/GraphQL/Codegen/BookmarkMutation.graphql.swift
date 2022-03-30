// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class BookmarkToggleMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation BookmarkToggle($id: String!) {
      bookmarkToggle(id: $id) {
        __typename
        id
        createdAt
      }
    }
    """

  public let operationName: String = "BookmarkToggle"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("bookmarkToggle", arguments: ["id": GraphQLVariable("id")], type: .object(BookmarkToggle.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(bookmarkToggle: BookmarkToggle? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "bookmarkToggle": bookmarkToggle.flatMap { (value: BookmarkToggle) -> ResultMap in value.resultMap }])
    }

    public var bookmarkToggle: BookmarkToggle? {
      get {
        return (resultMap["bookmarkToggle"] as? ResultMap).flatMap { BookmarkToggle(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "bookmarkToggle")
      }
    }

    public struct BookmarkToggle: GraphQLSelectionSet {
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
