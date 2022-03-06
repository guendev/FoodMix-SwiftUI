//
//  ProfileStretchView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//


import SwiftUI

struct ProfileStretchView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(spacing: 0) {
            
            StretchHeader(height: 250, offset: $viewModel.offset) {
                
                Color("AvavtarBackground")
                    .overlay(
                        
                        Group {
                            
                            if viewModel.ready {
                                
                                Image("food")
                                    .resizable()
                                
                            } else {
                                
                                RecipeAvatar(avatar: viewModel.user?.banner)
                                
                            }
                            
                        }
                            .scaledToFill()
                        
                    )
                    .clipped()
                    .redacted(reason: viewModel.ready ? [] : .placeholder)
                
            }
            
            Color.clear
                .frame(height: 60)
                .overlay(
                    
                    HStack {
                        
                        Circle()
                            .fill(Color("AvatarHeader"))
                            .frame(width: 100, height: 100, alignment: .center)
                            .overlay(
                                
                                Group {
                                    
                                    if viewModel.ready {
                                        
                                        RecipeAvatar(avatar: "https://user-pic.webnovel.com/userheadimg/4307667847-10/200.jpg")
                                        
                                    } else {
                                        
                                        Image("avatar")
                                            .resizable()
                                        
                                    }
                                    
                                }
                                    .scaledToFit()
                                    .frame(width: 90, height: 90)
                                    .clipShape(Circle())
                                    .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                                
                            )
                            .overlay(
                                
                                Image("male-gender")
                                    .renderingMode(.template)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(Color("Primary"))
                                    .frame(width: 15, height: 15)
                                    .padding(10)
                                    .background(Color("AvatarHeader"))
                                    .clipShape(Circle())
                                    .offset(x: 4, y: 1)
                                    .shadow(color: .black.opacity(0.03), radius: 10, x: 0.0, y: 0.0)
                                
                                ,alignment: .bottomTrailing
                                
                            )
                            .offset(x: 25)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            
                            Text("Theo Dõi")
                                .font(.caption)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 15)
                                .padding(.vertical, 8)
                                .foregroundColor(.white)
                                .background(Color("Primary"))
                                .cornerRadius(15)
                            
                        }
                        .offset(x: -25, y: 25)
                        .disabled(!viewModel.ready)
                        
                    }
                    
                    , alignment: .bottom
                )
                .redacted(reason: viewModel.ready ? [] : .placeholder)
            
        }
        
    }
}

struct ProfileStretchView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            ProfileView(slug: "igyuguyg")
            
        }
        
    }
}
