//
//  AboutFormView.swift
//  FoodMix
//
//  Created by Yuan on 12/03/2022.
//

import SwiftUI

struct AboutFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    init() {
        UITextView.appearance().backgroundColor = UIColor(Color("Background2"))
        UITextView.appearance().textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            PrimaryInputLabel(label: "Giới Thiệu")
    
            TextEditor(text: $viewModel.about)
                .font(.subheadline)
                .foregroundColor(Color("TextContent"))
                .accentColor(Color("TextContent"))
                .background(Color("Background2"))
                .lineSpacing(8)
                .overlay(
                    Text("Giới thiệu của bạn")
                        .foregroundColor(Color("InputText"))
                        .opacity($viewModel.about.wrappedValue.isEmpty ? 1 : 0)
                        .animation(.default)
                        .offset(x: 20, y: 20)
                    
                    ,alignment: .topLeading
                )
                .cornerRadius(15)
            
        }
        
    }
}
