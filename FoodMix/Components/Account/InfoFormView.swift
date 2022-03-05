//
//  InfoFormView.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI
import PhotosUI

struct InfoFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    @EnvironmentObject var appViewModel: AppViewModel
    
    @Environment(\.currentUserKey) private var currentUserData
    
    @State var name: String = ""
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            
            AvatarFormView()
            
            BannerFormView()
            
            Divider()
                .padding(.vertical)
            
            TextField("Tên Người Dùng", text: $viewModel.name)
                .primaryInput(label: "Tên Người Dùng")
            
            VStack(alignment: .leading) {
                
                TextField("user@foodmix.xyz", text: $viewModel.email)
                    .primaryInput(label: "Email ID")
                    .disabled(true)
                
                PrimaryInputLabel(label: "Bạn không thể thay đổi Email của mình")
                    .opacity(0.5)
                
            }
            
            Divider()
                .padding(.vertical)
            
            GenderFormView()
                .padding(.bottom, 5)
            
            ProvinceFormView(provinces: viewModel.provincesMap)
            
            AboutFormView()
            
            Group {
                
                Button {
                    
                    // Todo: Validate
                    viewModel.updateUser { user in
                        appViewModel.user = user
                    }
                    
                } label: {
                    
                    Text("Cập Nhật")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 20)
                        .frame(height: 40)
                        .background(Color("Primary"))
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    
                }
                .disabled(viewModel.loadingAvatar || viewModel.loadingBanner || viewModel.loadingUpdateInfo || !isChangeForm())
                
            }
            .withAlignment(alignment: .leading)
            .padding(.top)
            
        }
        .onAppear {
            
            viewModel.getProvinces()
            
            resetForm()
            
        }
        
    }
    
    func isChangeForm() -> Bool {
        
        return viewModel.name != currentUserData?.name || viewModel.avatar != currentUserData?.avatar || viewModel.banner != currentUserData?.banner || viewModel.gender != currentUserData?.gender || viewModel.province != currentUserData?.province || viewModel.about != currentUserData?.about
        
    }
    
    func resetForm() -> Void {
        viewModel.name = currentUserData?.name ?? ""
        viewModel.avatar = currentUserData?.avatar ?? ""
        viewModel.email = currentUserData?.email ?? ""
        viewModel.gender = currentUserData?.gender ?? .Boy
        viewModel.province = currentUserData?.province ?? "Hà Nội"
        viewModel.about = currentUserData?.about ?? ""
    }
}

struct InfoFormView_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            AccountView()
            
        }
        
    }
}
