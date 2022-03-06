//
//  AppBar.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

struct AppBar: View {
    
    var title: String
    var back: Bool
    let action: () -> Void
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var animation: Bool
    
    init(title: String, back: Bool = false, animation: Bool = true, action: @escaping () -> Void) {
        self.title = title
        self.animation = animation
        self.back = back
        self.action = action
    }
    
    var body: some View {
        
        HStack(spacing: 20) {
            
            if back {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                    
                }
                
            }
            
            Text(title)
                .fontWeight(.semibold)
                .lineLimit(1)
                .opacity(animation ? 1 : 0)
                .offset(y: animation ? 0 : -35)
            
                
            Spacer()
            
            Button {
                
                action()
                
            } label: {
                
                Image(systemName: "ellipsis")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .rotationEffect(Angle.init(degrees: 90))
                
            }
            
        }
        .padding(.vertical)
        
    }
}
