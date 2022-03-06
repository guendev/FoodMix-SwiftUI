//
//  RecipeStepperView.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct RecipeStepperView: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    @State var current: Int = .zero
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
                
            RecipeFirstStepper()
                .redacted(reason: viewModel.ready ? [] : .placeholder)
            
            VStack(spacing: 40) {
                
                if viewModel.recipe != nil {
                                   
                    ForEach((0...(viewModel.recipe!.stepper!.count - 1)),  id: \.self) { index in
                        
                        RecipeStepterItem(steper: getStepper(index), index: index, currentIndex: $current)
                        .overlay(
                        
                            RecipeStepperLine(current: $current, index: index, count: viewModel.recipe!.stepper!.count)
                            
                            ,alignment: .leading
                            
                        )
                        
                    }
                                   
                } else {
                    
                    Group {
                        ForEach((0...3),  id: \.self) { index in
                            
                            RecipeStepterItem(steper: Stepper(name: "Luoc Gao", content: "When your palette includes multiple shades of the same color, it can be convenient to group them together using our nested color object syntax", image: nil), index: index, currentIndex: .constant(0))
                            .overlay(
                            
                                RecipeStepperLine(current: .constant(0), index: index, count: 3)
                                
                                ,alignment: .leading
                                
                            )
                            
                        }
                        
                    }
                    .disabled(true)
                    .redacted(reason: .placeholder)
                    
                }
                
            }
            
        }
        
    }
    
    func getStepper(_ index: Int) -> Stepper {
        return viewModel.recipe!.stepper![index]
    }
    
}


struct RecipeStepterItem: View {
    
    
    var steper: Stepper
    var index: Int
    @Binding var currentIndex: Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            
            Button {
                
                withAnimation {
                    currentIndex = index
                }
                
            } label: {
                
                HStack {
                    
                    Text(steper.name)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(currentIndex > index ?  .black.opacity(0.7) : currentIndex == index ? Color("Primary") : .gray)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    if currentIndex >= index {
                        
                        Text(currentIndex == index ? "Đang Làm" : "Đã Làm")
                            .font(.caption)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 7)
                            .background( currentIndex != index ? Color("Success") : Color("Warning"))
                            .foregroundColor(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                    }
                    
                }
                
            }
            
            if currentIndex == index {
                
                
                Text("Tailwind includes an expertly-crafted default color palette out-of-the-box that is a great starting point if you don’t have your own specific branding in mind.")
                    .font(.custom(.customFont, size: 14))
                    .lineSpacing(6)
                    .foregroundColor(Color("TextContent"))
                    .fixedSize(horizontal: false, vertical: true)
                
            }
            
        }
        .padding(.leading, 45)
        
    }
    
}

struct RecipeStepperView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(slug: "le-thi-kim-ngan")
            
        }
    }
}
