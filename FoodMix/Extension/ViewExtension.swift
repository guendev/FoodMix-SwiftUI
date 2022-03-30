//
//  ViewExtension.swift
//  FoodMix
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI

extension View {
    
    func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    
    func safeInsets() -> UIEdgeInsets? {
        return UIApplication.shared.windows.first?.safeAreaInsets
    }
}


/// Error Form
extension View {
    func withErrorForm(msg: Binding<String>) -> some View {
        return self.modifier(ErrorFormMessage(msg: msg))
    }
    
    func initView(perform: @escaping () -> Void) -> some View {
        return self.modifier(InitView(perform: perform))
    }
}

struct ErrorFormMessage: ViewModifier {
    
    @Binding var msg: String
    
    func body(content: Content) -> some View {
        return VStack(alignment: .leading, spacing: 8) {
            
            content
            
            if !msg.isEmpty {
                
                Text(msg)
                    .font(.caption)
                    .foregroundColor(Color("Rose"))
                    .onAppear {
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                            withAnimation {
                                msg = ""
                            }
                        }
                        
                    }
                
            }
            
        }
    }
}



struct InitView: ViewModifier {
    
    @State private var ready: Bool = false
    
    var perform: () -> Void
    
    func body(content: Content) -> some View {
        return content
            .onAppear {
                
                // dừng task nếu đã hoạt động
                if ready { return }
                ready = true
                perform()
                
            }
    }
}
