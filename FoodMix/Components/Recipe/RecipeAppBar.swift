//
//  RecipeAppBar.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeAppBar: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    
    var body: some View {
        HStack(spacing: 20) {
            
            Button {
                
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                
                Image(systemName: "arrow.left")
                
            }
            
            Text("Sườn Xào Chua Ngọt")
                .fontWeight(.semibold)
                .lineLimit(1)
                .opacity(viewModel.offset < -300 ? 1 : 0)
                .offset(y: viewModel.offset < -300 ? 0 : -35)
            
            Spacer()
            
            Image(systemName: "ellipsis")
                .resizable()
                .scaledToFit()
                .frame(width: 20)
                .rotationEffect(Angle.init(degrees: 90))
                .withAuth()
                // .foregroundColor(.gray)
        }
        .padding(.vertical)
        .padding(.horizontal, 25)
        .foregroundColor(.white)
        .background(
            Color("Primary")
                .opacity(viewModel.offset < -300 ? 1 : 0)
                .ignoresSafeArea()
                .animation(.easeIn)
        )
        .shadow(color: .black.opacity(viewModel.offset < -300 ? 0.05 : 0), radius: 10, x: 0.0, y: 0.0)
    }
}


