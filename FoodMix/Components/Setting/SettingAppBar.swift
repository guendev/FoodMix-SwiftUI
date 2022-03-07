//
//  UserCenterView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct SettingAppBar: View {
    
    @EnvironmentObject var mainApp: MainViewModel
    
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
            
            Text("Cài Đặt")
                .font(.title2)
                .foregroundColor(Color("TextTitle"))
            
            
        }
        .padding(.vertical)
    }
}

struct UserCenterView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            MainView()
            
        }
    }
}
