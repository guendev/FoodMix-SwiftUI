//
//  LoginView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI
import Introspect

struct AuthView: View {
    
    @StateObject var viewModel: AuthViewModel = AuthViewModel()
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var animation: Bool = false
    
    var body: some View {
        VStack {
            
            HStack {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color("TextTitle"))
                    
                }
                
                Spacer()
            }
            .padding(.vertical)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                Image("login1")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect( animation ? 1 : 0.8)
                    .frame(width: getScreenBounds().width - 100)
                    .padding(.top, 50)
                
                
                Text("\(viewModel.type == .SignIn ? "Đăng Nhập" : "Đăng Ký")")
                    .font(.title)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 40)
                    .padding(.bottom, 25)
                
                // input group
                AuthFormView()
                
                HStack {
                    
                    Rectangle().fill(Color("TextContent").opacity(0.3)).frame(height: 1)
                    
                    Text("TIẾP TỤC VỚI")
                        .foregroundColor(Color("TextContent").opacity(0.4))
                        .font(.caption)
                    
                    Rectangle().fill(Color("TextContent").opacity(0.3)).frame(height: 1)
                    
                }
                .padding(.vertical, 25)
                
                Button {
                    
                } label: {
                    
                    HStack {
                        
                        
                        Image("google")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 28, height: 28)
                        
                        Text("Tiếp Tục Bằng Google")
                            .font(.caption)
                            .foregroundColor(Color("TextContent"))
                            .frame(maxWidth: .infinity)

                    }
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(Color("Background2"))
                .cornerRadius(15)
                
                
                HStack {
                    
                    Text("\(viewModel.type == .SignIn ? "Chưa" : "Đã") có tài khoản?")
                        .foregroundColor(Color("TextContent"))
                    
                    Button {
                        
                        withAnimation {
                            viewModel.type = viewModel.type == .SignIn ? .SignUp : .SignIn
                        }
                        
                    } label: {
                        
                        Text("Đăng \(viewModel.type == .SignIn ? "ký" : "nhập") ngay!")
                            .font(.subheadline)
                            .foregroundColor(Color("Primary"))
                        
                    }
                    
                }
                .font(.caption)
                .padding(.vertical, 25)
                
            }
        }
        .padding(.horizontal, 25)
        .background(Color("Background").ignoresSafeArea())
        .environmentObject(viewModel)
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation(.spring()) {
                    animation = true
                }
            }
            
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper {
                
                AuthView()
                
            }
            PreviewWrapper {
                
                AuthView()
                
            }
            .environment(\.colorScheme, .dark)
        }
    }
}
