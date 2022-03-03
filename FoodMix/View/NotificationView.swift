//
//  NotificationView.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI
import Introspect

struct NotificationView: View {
    
    @Environment(\.authKey) var auth
    
    var body: some View {
        
        VStack {
            
            NotificationAppBar()
            
            ScrollView(.vertical, showsIndicators: false) {
                
                if auth {
                    
                    NotificationContent()
                        .padding(.top, 25)
                    
                } else {
                    
                    
                    EmptyContent()
                        .padding(.top, 100)
                    
                    PrimaryButtonView(title: "Đăng Nhập", active: .constant(false)) {
                        
                    }
                    .padding(.top)
                    .frame(maxWidth: 250)
                    .withAuth()
                    
                    
                }
                
            }
            
        }
        .padding(.horizontal, 25)
        .background(Color("Background").ignoresSafeArea())
        
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            MainView()
            
        }
        
    }
}
