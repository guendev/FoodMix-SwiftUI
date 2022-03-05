//
//  GenderFormView.swift
//  FoodMix
//
//  Created by Yuan on 12/03/2022.
//

import SwiftUI

struct GenderFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 17) {
            
            PrimaryInputLabel(label: "Giới Tính")
            
            HStack(spacing: 25) {
                
                GenderButton(gender: .Boy, title: "Nam")
                
                GenderButton(gender: .Girl, title: "Nữ")
                
                GenderButton(gender: .UnKnown, title: "Bí Mật")
                
            }
            
        }
        
    }
    
    @ViewBuilder
    func GenderButton(gender: UserGender, title: String) -> some View {
        
        Button {
            
            viewModel.gender = gender
            
        } label: {
            
            CheckBoxView(current: viewModel.gender == gender)
            
            PrimaryInputLabel(label: title)
                .font(.callout)
            
        }
        
    }
    
}


struct GenderFormView_Previews: PreviewProvider {
    static var previews: some View {
        GenderFormView()
    }
}
