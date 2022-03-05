//
//  PasswordFormView.swift
//  FoodMix
//
//  Created by Yuan on 14/03/2022.
//

import SwiftUI

struct PasswordFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    @State var currentPasswordError: String = ""
    @State var newPasswordError: String = ""
    @State var rePasswordError: String = ""
    
    var body: some View {
        
        
        VStack(alignment: .leading, spacing: 20) {
            
            SecureField("*********", text: $viewModel.currentPassword)
                .primaryInput(label: "Mật khẩu hiện tại")
                .withErrorForm(msg: $currentPasswordError)
            
            SecureField("*********", text: $viewModel.newPassword)
                .primaryInput(label: "Mật khẩu mới")
                .withErrorForm(msg: $newPasswordError)
            
            SecureField("*********", text: $viewModel.rePassword)
                .primaryInput(label: "Xác nhận mật khẩu mới")
                .withErrorForm(msg: $rePasswordError)
            
            PrimaryButtonView(title: "Thay Đổi", active: $viewModel.loadingUpdatePassword) {
                submitPassword()
            }
            
            
        }
        
    }
    
    func submitPassword() -> Void {
        if viewModel.loadingUpdatePassword {
            return
        }
        if viewModel.currentPassword == "" {
            currentPasswordError = "Mật khẩu hiện tại là bắt buộc"
        }
        if viewModel.newPassword == "" {
            newPasswordError = "Mật khẩu mới là bắt buộc"
        }
        if viewModel.rePassword == "" {
            rePasswordError = "Nhập lại mật khẩu là bắt buộc"
        } else if viewModel.rePassword != viewModel.newPassword {
            rePasswordError =  "Mật khẩu hiện tại không đúng"
        }
        
        if currentPasswordError != "" || newPasswordError != "" || rePasswordError != "" {
            // Validate thất bại
            return
        }
        viewModel.updatePassword {
            // Nothing
        }
    }
}

struct PasswordFormView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            AccountView()
            
        }
    }
}
