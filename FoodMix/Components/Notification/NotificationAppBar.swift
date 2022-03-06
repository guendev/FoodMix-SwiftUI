//
//  NotificationAppBar.swift
//  FoodMix
//
//  Created by Yuan on 30/03/2022.
//

import SwiftUI

struct NotificationAppBar: View {
    
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
            
            Text("Thông Báo")
                .font(.title2)
                .foregroundColor(Color("TextTitle"))
                        
        }
        .padding(.vertical)
        
    }
}

struct NotificationAppBar_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            MainView()
            
        }
    }
}
