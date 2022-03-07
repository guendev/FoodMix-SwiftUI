//
//  WelcomeAvatar.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct WelcomeAvatar: View {
    var body: some View {
        HStack {
            
            ForEach(boardingScreens) { screen in
                
                VStack(spacing: 15) {
                    
                    Image(screen.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: getScreenBounds().width - 100, height: getScreenBounds().width - 100)
                                                    .offset(y: -150)
                    
                    VStack(alignment: .leading, spacing: 15) {
                                                
                        Text(screen.title)
                            .font(.largeTitle.bold())
                            .foregroundColor(.white.opacity(0.7))
                                                
                        Text(screen.description)
                            .fontWeight(.semibold)
                            .foregroundColor(.white.opacity(0.7))
                                                
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical)
                    .padding(.horizontal, 25)
                    .offset(y: -70)
                    
                }
                .frame(width: getScreenBounds().width)
                .frame(maxHeight: .infinity)
                
            }
            
        }
    }
}

struct WelcomeAvatar_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeAvatar()
    }
}
