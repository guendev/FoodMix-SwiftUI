//
//  LoginViewModel.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI
import SwiftValidators

class AuthViewModel: ObservableObject {
    
    
    @Published var name: String = ""
    @Published var nameError: String = ""
    
    @Published var email: String = "dnstylish9@gmail.com"
    @Published var emailError: String = ""
    
    @Published var password: String = "Khoi@025"
    @Published var passwordError: String = ""
    
    @Published var showPass: Bool = false
    
    @Published var type: AuthPage = .SignIn
    
    @Published var loading: Bool = false
    
    
    func signin(success: @escaping (_ token: String) -> Void) -> Void {
        
        validateForm {
            
            self.loading = true
            
            Network.shared.apollo.perform(mutation: SigninMutation(input: SignInInput(email: self.email, password: self.password))) { result in
                
                switch result {
                
                case .success(let graphQLResult) :
                    
                    if graphQLResult.errors != nil {
                        break
                    }
                    
                    guard let token = graphQLResult.data?.signin.token else { break }

                    // lưu data
                    Toastify.show("Đăng Nhập Thành Công", image: "bell")
                                      
                    success(token)
                                    
                    break
                    
                case .failure(_): break
                    // Lỗi mạng
                }
            }
            
        }
        
    }
    
    func signup(success: @escaping (_ token: String) -> Void) -> Void {
        validateForm {
            self.loading = true
            Network.shared.apollo.perform(mutation: SignupMutation(input: SignUpInput(name: self.name, email: self.email, password: self.password))) { result in
                
                switch result {
                
                case .success(let graphQLResult) :
                    
                    if let errors = graphQLResult.errors {
                        
                        print("❌ DEBUG: \(String(describing: errors.first?.message))")
                        break
                    }
                    
                    guard let token = graphQLResult.data?.signup.token else { break }
                    
                    Toastify.show("Đăng Ký Thành Công", image: "bell")
                    
                    success(token)
                                                        
                    break
                    
                case .failure(_): break
                    // Lỗi mạng
                }
            }
        }
    }
    
    func checkEmail() -> String {
        var error = ""
        if email == "" {
            error = "Email không được để trống"
        } else if !Validator.isEmail().apply(email) {
            error = "Email không hợp lệ"
        }
        return error
    }
    
    func checkPassword(new: Bool = false) -> String {
        var error = ""
        if password == "" {
            error = "Mật khẩu không được để trống"
        } else if password.count <= 6 {
            error = "Mật khẩu quá ngắn"
        }
        
        return error
    }
    
    func checkName() -> String {
        var error = ""
        if name == "" {
            error = "Tên không được để trống"
        } else if name.count > 20  {
            error = "Tên không quá 20 ký tự"
        }
        return error
    }
    
    func validateForm(completion: @escaping () -> Void) -> Void {
        
        withAnimation {
            emailError = checkEmail()
            passwordError = checkPassword(new: type == .SignUp)
        }
        
        if type == .SignIn {
            
            if emailError == "" && passwordError == "" {
                completion()
            }
            
        } else {
            
            nameError = checkName()
            
            if emailError == "" && passwordError == "" && nameError == "" {
                completion()
            }
            
        }
        
        
    }
    
}

enum AuthPage {
    case SignIn
    case SignUp
}
