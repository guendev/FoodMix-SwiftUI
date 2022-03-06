//
//  RecipeFirstStepper.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct RecipeFirstStepper: View {
    var body: some View {
        Button {
            
        } label: {
            
            HStack(spacing: 20) {
                
                Image(systemName: "plus.magnifyingglass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .offset(x: 5)
                
                Text("Hãy theo dõi và hoàn thành món ăn của mình bạn nhé. Chúc bạn thành công ^^")
                    .font(.caption)
                    .fixedSize(horizontal: false, vertical: true)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .foregroundColor(.white)
            .padding(15)
            .padding(.trailing, 25)
            .background(Color("Primary"))
            .overlay(
            
                Circle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 70, height: 70)
                    .offset(x: 20, y: 20)
                
                ,alignment: .bottomTrailing
                
            )
            .overlay(
            
                Circle()
                    .fill(Color.white.opacity(0.2))
                    .frame(width: 20, height: 20)
                    .offset(x: -50, y: -12)
                
                ,alignment: .trailing
                
            )
            .clipShape(RoundedRectangle(cornerRadius: 15))
            
        }

    }
}

struct RecipeFirstStepper_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            
            RecipeFirstStepper()
            
        }
        .padding(25)
        .background(Color("Background").ignoresSafeArea())
    }
}
