//
//  UserCenter.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct UserCenter: View {
    
    @Environment(\.currentUserKey) private var currentUser
    @Environment(\.authKey) private var authKey
    
    var body: some View {
       
        Group {
            
            HStack(spacing: 16) {
                
                Circle()
                    .fill(Color("Primary").opacity(0.3))
                    .overlay(
                        Group {
                            
                            if authKey {
                                
                                RecipeAvatar(avatar: currentUser?.avatar)
                                    .id(currentUser?.avatar)
                                
                            } else {
                                
                                Image("avatar")
                                    .resizable()
                                
                            }
                            
                        }
                            .scaledToFill()
                            .withAuth()
                    )
                    .frame(width: 56, height: 56)
                    .clipShape(Circle())
                
                VStack(alignment:  .leading, spacing: 0) {
                    
                    Text(currentUser?.name ?? "--")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("TextTitle"))
                        .lineLimit(1)
                    
                    if authKey {
                        
                        Text("dnstylish@gmail.com")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                    }
                    
                }
                
                Spacer()
                
                if authKey {
                    
                    NavigationLink( destination: AccountView()) {
                        Text("Sửa")
                            .font(.caption)
                            .foregroundColor(.white)
                            .padding(.horizontal, 15)
                            .padding(.vertical, 5)
                            .background(Color("Warning"))
                            .cornerRadius(20)
                    }
                    .buttonStyle(PlainButtonStyle())

                    
                }
                
            }
            
        }
        
    }
}

struct UserCenter_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            SettingView()
            
        }
        
    }
}
