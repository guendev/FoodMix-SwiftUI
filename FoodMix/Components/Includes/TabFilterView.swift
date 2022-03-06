//
//  TabFilterView.swift
//  FoodMix
//
//  Created by Yuan on 08/03/2022.
//

import SwiftUI

struct TabFilterView<T: AnyObject>: View {
    
    var filters: [T]
    
    @Binding var current: T
    
    var title: (_ item: T) -> String
    
    var isCurrent: (_ item: T, _ current: T) -> Bool
    
    @Namespace var animetion
    
    
    var body: some View {
        HStack {
            
            ForEach(0...(filters.count - 1), id: \.self) { index in
                
                TabActiveView(title: title(filters[index]), tab: filters[index])
                
            }
            
        }
    }
    
    @ViewBuilder
    private func TabActiveView(title: String,  tab: T) -> some View {
        Button {
            
            if !isCurrent(tab, current) {
                
                withAnimation(.spring()) {
                    
                    current = tab
                    
                }
                
            }
            
        } label: {
            
            Text(title)
                .font(.caption)
                .foregroundColor(isCurrent(tab, current) ? Color("TextContent").opacity(0.8) : Color("TextContent"))
                .overlay(
                    
                    Group {
                        
                        if isCurrent(tab, current) {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color("Primary"))
                                .frame(height: 3)
                                .offset(y: 6)
                                .matchedGeometryEffect(id: "FILTER_TAB", in: animetion)
                            
                        }
                        
                    }
                    
                    ,alignment: .bottom
                    
                )
            
        }
    }
    
    
}
