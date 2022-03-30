//
//  SettingView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct SettingView: View {
    
    @EnvironmentObject var app: AppViewModel
    
    @Environment(\.currentUserKey) private var userData
    @Environment(\.authKey) private var authKey
    
    
    var body: some View {
        
        VStack {
            
            SettingAppBar()
                .padding(.horizontal, 25)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 35) {
                    
                    UserCenter()
                        .padding(.horizontal, 25)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Cài Đặt Chung")
                            .font(.callout)
                            .foregroundColor(Color("TextTitle"))
                            .padding(.bottom, 10)
                            .padding(.horizontal, 25)
                        
                        SettingItemView(title: "Thư Viện") {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color("TextContent"))
                        }
                        
                        SettingItemView(title: "Lịch Sử") {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color("TextContent"))
                        }
    
                        
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text("Cài Đặt Chung")
                            .font(.callout)
                            .foregroundColor(Color("TextTitle"))
                            .padding(.bottom, 10)
                            .padding(.horizontal, 25)
                        
                        SettingColorSchema()
                        
                        SettingItemView(title: "Trung Tâm Chính Sách") {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color("TextContent"))
                        }
                        
                        SettingItemView(title: "Số Phiên Bản") {
                            Image(systemName: "arrow.right")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 12, height: 12)
                                .foregroundColor(Color("TextContent"))
                        }
    
                        
                    }
                    
                    PrimaryButtonView(
                        title: authKey ? "Đăng Xuất" : "Đăng Nhập",
                        active: .constant(false),
                        background: authKey ? Color("Warning") : Color("Primary")
                    ) {
                        
                        app.onLogout {
                            
                        }
                        
                    }
                    .withAuth()
                    .padding(.horizontal, 25)
                    
                }
                .padding(.top, 25)
                
            }
            
        }
        .background(Color("Background").ignoresSafeArea())
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            MainView()
            
        }
    }
}
