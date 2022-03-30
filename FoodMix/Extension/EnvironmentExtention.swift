//
//  EnvironmentExtention.swift
//  FoodMix
//
//  Created by Yuan on 07/03/2022.
//

import SwiftUI

// 1. Create the key with a default value
private struct AuthKey: EnvironmentKey {
  static let defaultValue = false
}

private struct CurrentUserKey: EnvironmentKey {
    static let defaultValue: User? = nil
}


// support review sheet
private struct CurrentRecipeKey: EnvironmentKey {
    static let defaultValue: Bool = false
}

// 2. Extend the environment with our property
extension EnvironmentValues {
    
    var authKey: Bool {
        get { self[AuthKey.self] }
        set { self[AuthKey.self] = newValue }
    }
    
    
    var currentUserKey: User? {
        get { self[CurrentUserKey.self] }
        set { self[CurrentUserKey.self] = newValue }
    }
    
}

extension View {
    
    func asyncAuthData(auth: Binding<Bool>, currentUser: Binding<User?>) -> some View {
        return self.modifier(AsyncAuthData(auth: auth, currentUser: currentUser))
    }
    
}

// auth modifier
struct AsyncAuthData: ViewModifier {
    
    @Binding var auth: Bool
    @Binding var currentUser: User?
    
    @Environment(\.authKey) private var authData
    @Environment(\.currentUserKey) private var currentUserData
    
    func body(content: Content) -> some View {
        return content
            .onChange(of: authData) { newValue in
                // current user dc thay đổi dựa theo auth
                auth = newValue
                currentUser = currentUserData
            }
            .onAppear {
                auth = authData
                currentUser = currentUserData
            }
    }
}

