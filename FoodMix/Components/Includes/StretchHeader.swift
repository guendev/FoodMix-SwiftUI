//
//  StretchHeader.swift
//  FoodMix
//
//  Created by Yuan on 03/03/2022.
//

import SwiftUI

struct StretchHeader<Content: View>: View {
    
    var height: CGFloat
    @Binding var offset: CGFloat
    @State var stretchHeight: CGFloat = .zero
    
    @ViewBuilder var content: Content
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack(alignment: .bottom) {
                
                content
                
            }
            .frame(width: geo.frame(in: .global).width)
            .frame(height: height + stretchHeight)
            .offset(y: -stretchHeight)
            .onChange(of: geo.frame(in: .global), perform: { value in
                scaleHeight(geo.frame(in: .global))
            })
            
        }
        .frame(height: height)
        
    }
    
    func scaleHeight(_ rect: CGRect) -> Void {
        stretchHeight = rect.minY >= 0 ? rect.minY : 0
        offset = rect.minY
    }
}

