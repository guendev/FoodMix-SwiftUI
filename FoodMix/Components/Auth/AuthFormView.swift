//
//  LoginFormView.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct AuthFormView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @EnvironmentObject var app: AppViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    var body: some View {
        
        VStack(spacing: 20) {
            
            if viewModel.type == .SignUp {
                
                TextField("Tên Người Dùng", text: $viewModel.name)
                    .keyboardType(.emailAddress)
                    .primaryInput(icons: [.leading])
                    .overlay(
                        
                        Image(systemName: "person")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("TextContent"))
                            .frame(width: 15, height: 15)
                            .offset(x: 17)
                        
                        ,alignment: .leading
                        
                    )
                    .withErrorForm(msg: $viewModel.nameError)
                
            }
                        
            TextField("Email ID", text: $viewModel.email)
                .keyboardType(.emailAddress)
                .primaryInput(icons: [.leading])
                .overlay(
                    
                    Image(systemName: "envelope")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("TextContent"))
                        .frame(width: 15, height: 15)
                        .offset(x: 17)
                    
                    ,alignment: .leading
                    
                )
                .withErrorForm(msg: $viewModel.emailError)
            
            
            PasswordField()
                .font(.custom(.customFont, size: 16))
                .primaryInput(icons: [.leading, .trailing])
                .overlay(
                    
                    Image(systemName: "lock.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("TextContent"))
                        .frame(width: 15, height: 15)
                        .offset(x: 17)
                    
                    ,alignment: .leading
                    
                )
                .overlay(
                    
                    Button {
                        
                        withAnimation {
                            viewModel.showPass.toggle()
                        }
                        
                    } label: {
                        
                        Image(systemName: viewModel.showPass ? "eye.slash" : "eye")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color("TextContent"))
                            .frame(width: 15, height: 15)
                            .offset(x: -17)
                        
                    }
                    
                    ,alignment: .trailing
                    
                )
                .withErrorForm(msg: $viewModel.passwordError)
            
            HStack {
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Text("Quên mật khẩu?")
                        .font(.caption)
                        .foregroundColor(Color("TextContent"))
                    
                }
                
            }
            
            PrimaryButtonView(
                title: "\(viewModel.type == .SignIn ? "Đăng Nhập" : "Đăng Ký")".uppercased(),
                active: $viewModel.loading
            ) { authAction() }
            
            
        }
        .frame(maxWidth: 400)
        
    }
    
    @ViewBuilder
    private func PasswordField() -> some View {
        if viewModel.showPass {
            
            TextField("********", text: $viewModel.password)
                        
            
        } else {
            
            SecureField("********", text: $viewModel.password) {
                
            }
            
        }
    }
    
    @ViewBuilder
    func ErrorMessage() -> some View {
        Text("Email không hợp lệ")
            .font(.subheadline)
            .foregroundColor(Color("Rose"))
    }
    
    func authAction() -> Void {
        
        if viewModel.type == .SignIn {
            viewModel.signin { token in
                app.onLogin(token: token) {
                    viewModel.loading = false
                    presentationMode.wrappedValue.dismiss()
                }
            }
        } else {
            viewModel.signup { token in
                app.onLogin(token: token) {
                    viewModel.loading = false
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
        
    }
}

struct AuthFormView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            AuthView()
            
        }
    }
}
