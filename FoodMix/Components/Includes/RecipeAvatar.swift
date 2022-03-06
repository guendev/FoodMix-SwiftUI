//
//  RecipeAvatar.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI
import SDWebImageSwiftUI

struct RecipeAvatar: View {
    
    @State var avatar: String?
        
    var body: some View {
        WebImage(url: URL(string: avatarUrl()))
            // Supports options and context, like `.delayPlaceholder` to show placeholder only when error
            .onSuccess { image, data, cacheType in
                // Success
                // Note: Data exist only when queried from disk cache or network. Use `.queryMemoryData` if you really need data
            }
            .onFailure { _ in
            }
            .resizable() // Resizable like SwiftUI.Image, you must use this modifier or the view will use the image bitmap size
            .placeholder {
                
                Color("AvavtarBackground")
                        
                
            } // Placeholder Image
            // Supports ViewBuilder as well
            .transition(.fade(duration: 0.5))
    }
    
    func avatarUrl() -> String {
        guard let avatar = avatar else { return "" }
        
        if avatar.hasPrefix("http") {
            return avatar
        }
        return "http://localhost:3000" + avatar
    }
}

struct RecipeAvatar_Previews: PreviewProvider {
    static var previews: some View {
        
        RecipeAvatar(avatar: "")
            .scaledToFit()
            .frame(width: 200, height: 200)
        
    }
}
