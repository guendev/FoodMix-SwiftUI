//
//  InputExtention.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI

extension View {
    
    func primaryInput(icons: Edge.Set.ArrayLiteralElement = [], label: String? = nil, radius: Double? = nil) -> some View {
        self.modifier(PrimaryInput(icons: icons, label: label, radius: radius))
    }
    
}

struct PrimaryInput: ViewModifier {
    
    var icons: Edge.Set.ArrayLiteralElement = []
    var label: String?
    var radius: Double?
    
    func body(content: Content) -> some View {
        return content
            .autocapitalization(.none)
            .font(.subheadline)
            .foregroundColor(Color("TextContent"))
            .frame(height: 45)
            .padding(icons, 25)
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity)
            .background(Color("Background2"))
            .cornerRadius(CGFloat(radius ?? 15))
            .padding(.top, label != nil ? 30 : 0)
            .overlay(
                
                Group {
                    
                    if label != nil {
                        
                        PrimaryInputLabel(label: label!)
                        
                    }
                    
                }
                
                ,alignment: .topLeading
            )
            .accentColor(Color("TextContent"))
    }
}

struct PrimaryInputLabel: View {
    
    var label: String
    
    var body: some View {
        
        Text(label)
            .font(.caption)
            .foregroundColor(Color("TextContent"))
        
    }
    
}
