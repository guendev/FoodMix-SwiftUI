//
//  SetiingColorSchema.swift
//  FoodMix
//
//  Created by Yuan on 09/03/2022.
//

import SwiftUI

struct SettingColorSchema: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    @State var isLight: Bool = true
    
    var body: some View {
        SettingItemView(title: "Giao Diện Sử Dụng") {
            
            ToggleView(value: $isLight, onImage: "sun", offImage: "moon")
                .onChange(of: isLight) { newValue in
                    
                }
        }
        .onAppear {
            
            isLight = colorScheme == .light
            
        }
    }
}

fileprivate struct ToggleView: View {
    
    @Binding var value: Bool
    
    var onImage: String
    var offImage: String
    
    @State private var show: Bool = true
    
    
    var body: some View {
        
        Button {
            
            if !show { return }
            
            withAnimation(.spring()) {
                show = false
            }
            
            value.toggle()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                withAnimation(.spring()) {
                    show = true
                }
            }

        } label: {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color("Background2"))
                    .frame(width: 35, height: 15)
                
                Image(value ? onImage : offImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .offset(x: value ? -35/2 : 35/2)
                    .animation(.easeIn(duration: 0.25))
                    .scaleEffect(show ? 1: 0)
                
                
            }
            
        }
        .buttonStyle(PlainButtonStyle())
        
    }
}

struct SettingColorSchema_Previews: PreviewProvider {
    static var previews: some View {
        SettingColorSchema()
            .previewLayout(.sizeThatFits)
    }
}
