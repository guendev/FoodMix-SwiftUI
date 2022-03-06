//
//  EmptyContent.swift
//  FoodMix
//
//  Created by Yuan on 15/03/2022.
//

import SwiftUI

struct EmptyContent: View {
    var body: some View {
        
        VStack {
            
            Image("recipe_book")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: 250)
            
            Text("Mọi thứ chỉ tới đây thôi")
                .font(.caption)
                .foregroundColor(Color("TextContent"))
            
        }
        
    }
}
