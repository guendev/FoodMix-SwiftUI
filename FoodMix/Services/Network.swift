//
//  Network.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import Foundation
import Apollo
import ApolloWebSocket
import SwiftUI

class Network {
    
    static let shared = Network()
    
    static let store: ApolloStore = shared.apollo.store

    private(set) lazy var apollo: ApolloClient = {
    
        
        /// An HTTP transport to use for queries and mutations
        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let authPayloads = ["Authorization": "Bearer \(getToken())"]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = authPayloads
                
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        let provider = NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
                
        let url = URL(string: "http://localhost:3000/graphql")!
                
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        
        /// A web socket transport to use for subscription
        
        let urlWs = URL(string: "ws://localhost:3000/graphql")!
        let webSocketClient = WebSocket(url: urlWs, protocol: .graphql_ws)
        
        let authPayload = ["Authorization": "Bearer \(getToken())"]
        
        let wsTransport = WebSocketTransport(websocket: webSocketClient, connectingPayload: authPayload)
        
        var splitNetworkTransport = SplitNetworkTransport(
            uploadingNetworkTransport: requestChainTransport,
            webSocketNetworkTransport: wsTransport
          )
                
        return ApolloClient(networkTransport: splitNetworkTransport, store: store1)
        
    }()
    
}


class NetworkInterceptorProvider: DefaultInterceptorProvider {
    override func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(JsonWebTokenInterceptor(), at: 0)
        interceptors.append(ResponseLoggingInterceptor())
        return interceptors
    }
}

class JsonWebTokenInterceptor: ApolloInterceptor {
    
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Swift.Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        request.addHeader(name: "Authorization", value: "Bearer \(getToken())")
                    
        print("\n☁️ GraphQL: \(request.operation.operationName)")
        chain.proceedAsync(request: request, response: response, completion: completion)
        
    }
    
    
}

class ResponseLoggingInterceptor: ApolloInterceptor {

  enum ResponseLoggingError: Error {
    case notYetReceived
  }

  func interceptAsync<Operation: GraphQLOperation>(
    chain: RequestChain,
    request: HTTPRequest<Operation>,
    response: HTTPResponse<Operation>?,
    completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
    
    defer {
          // Even if we can't log, we still want to keep going.
          chain.proceedAsync(request: request, response: response, completion: completion)
    }

    guard let receivedResponse = response else {
        chain.handleErrorAsync(ResponseLoggingError.notYetReceived, request: request, response: response, completion: completion)
          return
    }

    print("\n🌦 GraphQL Response: \(request.operation.operationName) - \(receivedResponse.rawData)")
    
    guard let graphQLResult = receivedResponse.parsedResponse else { return }
    
    
    if let error = graphQLResult.errors?.first {
        
        if let code = error.extensions?["code"] as? String {
                        
            switch code {
            case "UNAUTHENTICATED":
                // Không đăng nhập
                // Xoá token
                UserDefaults.standard.removeObject(forKey: "jsonwebtoken")
            default:
                break
            }
            
        }
        
    }
    
  }
}

fileprivate func getToken() -> String {
    return UserDefaults.standard.string(forKey: "jsonwebtoken") ?? ""
}
