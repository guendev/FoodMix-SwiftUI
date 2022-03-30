//
//  AlignExtention.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI

extension View {
    func withAlignment(alignment: Alignment) -> some View {
        
        self.modifier(WithAlignment(alignment: alignment))
        
    }
}

struct WithAlignment: ViewModifier {
    
    var alignment: Alignment
    
    func body(content: Content) -> some View {
        return content
            .frame(maxWidth: .infinity, alignment: alignment)
    }
}
