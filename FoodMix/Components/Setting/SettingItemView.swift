//
//  SettingItemView.swift
//  FoodMix
//
//  Created by Yuan on 09/03/2022.
//

import SwiftUI

struct SettingItemView<Content: View>: View {
    
    var title: String
    
    let content: Content
        
    init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        
        HStack {
            
            Text(title)
                .font(.subheadline)
                .foregroundColor(Color("TextContent"))
            
            Spacer()
            
            content
            
        }
        .padding(.horizontal, 25)
        .frame(height: 50)
        .background(Color("Background2"))
        
    }
    
}

struct SettingItemView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            SettingView()
            
        }
    }
}
