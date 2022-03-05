//
//  ProvinceFormView.swift
//  FoodMix
//
//  Created by Yuan on 10/03/2022.
//

import SwiftUI

struct ProvinceFormView: View {
    
    @EnvironmentObject var viewModel: AccountViewModel
    
    var provinces: [String] = ["Hà Nội", "Phú Yên"]
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            PrimaryInputLabel(label: "Quê Quán")
            
            Picker("Quê Quán Của Bạn", selection: $viewModel.province) {
                ForEach(provinces, id: \.self) { province in
                    Text("\(province)")
                }
            }
            .accentColor(Color("TextContent"))
            .withAlignment(alignment: .leading)
            .primaryInput()
    
            
        }
        
    }
    
}
