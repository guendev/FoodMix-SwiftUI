//
//  WelcomeButtons.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct WelcomeButtons: View {
    
    @EnvironmentObject var viewModel: WelcomeViewModel
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            HStack(spacing: 25) {
                
    
                NavigationLink( destination: AuthView()) {
                    
                    Text("Đăng Nhập")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextTitle"))
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color("Background"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                
                
                Button {
                    
                } label: {
                    
                    Text("Đăng Ký")
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextTitle"))
                        .padding(.vertical, 20)
                        .frame(maxWidth: .infinity)
                        .background(Color("Background"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    
                }
                
            }
            
            HStack {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                                            
                } label: {
                                            
                    Text("Skip")
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.7))
                                            
                }
                
                HStack(spacing: 8) {
                                        
                     ForEach(boardingScreens.indices, id: \.self) { index in
                                            
                        Circle()
                            .fill(Color.white)
                            .opacity(index == viewModel.currentIndex ? 1 : 0.4)
                            .frame(width: 8, height: 8)
                            .scaleEffect(index == viewModel.currentIndex ? 1.3 : 0.85)
                            .animation(.easeInOut, value: viewModel.currentIndex)
                                            
                        }
                                        
                    }
                    .frame(maxWidth: .infinity)
                
                
                Button {
                    
                    withAnimation {
                        viewModel.offset =  CGFloat((viewModel.currentIndex + 1)) * getScreenBounds().width
                    }
                                            
                } label: {
                                            
                    Text("Next")
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.7))
                                            
                }
                .opacity( viewModel.currentIndex == boardingScreens.count - 1 ? 0.6 : 1)
                .animation(.easeIn, value: viewModel.currentIndex)
                .disabled(viewModel.currentIndex == boardingScreens.count - 1)
            }
            
        }
        .padding(.horizontal, 25)

    }
}

struct WelcomeButtons_Previews: PreviewProvider {
    static var previews: some View {
        
        
        PreviewWrapper {
            // WelcomeView(, showSheet: <#Binding<Bool>#>)
        }
        
    }
}
