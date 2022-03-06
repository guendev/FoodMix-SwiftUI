//
//  HelloView.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct HelloView: View {
    
    @EnvironmentObject var app: AppViewModel
    @EnvironmentObject var mainApp: MainViewModel
    
    @AppStorage("welcome") var welcome: Bool = true
    
    var body: some View {
        HStack {
            
            Button {
                
                withAnimation(.spring()) {
                    mainApp.showMenu.toggle()
                }
                
            } label: {
                
                Image(systemName: "text.alignleft")
                    .foregroundColor(Color("TextTitle"))
                
            }

            
            Spacer()
            
            NavigationLink(destination: ProfileView(slug: app.user?.slug ?? "")) {
                Group {
                    if app.auth {
                        RecipeAvatar(avatar: app.user?.avatar)
                    } else {
                        Image("avatar")
                            .resizable()
                    }
                }
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(Circle())
            }
            .withAuth()
            
        }
    }
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            MainView()
            
        }
        
    }
}
