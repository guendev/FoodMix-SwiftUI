//
//  ProfileAboutView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

struct ProfileAboutView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        ZStack {
            
            if viewModel.ready {
                
                AboutTemplate(
                    name: viewModel.user!.name,
                    slug: viewModel.user!.slug,
                    map: viewModel.user?.province ?? "Việt Nam",
                    about: viewModel.user?.about ?? "Lười quá"
                )
                
            } else {
                
                AboutTemplate(name: "Danny", slug: "yuan", map: "Đà Lạt", about: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour")
                    .redacted(reason: .placeholder)
                
            }
            
        }
        
    }
    
    @ViewBuilder
    private func AboutTemplate(name: String, slug: String, map: String, about: String) -> some View {
        
        VStack(alignment: .leading, spacing: 12) {
            
            Text(name)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("TextTitle"))
                .frame(maxWidth: getScreenBounds().width - 170, alignment: .leading)
            
            HStack(spacing: 30) {
                
                Text("@\(slug)")
                    .font(.subheadline)
                    .lineLimit(1)
                
                HStack(spacing: 5) {
                    
                    Image(systemName: "mappin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 13, height: 13)
                    
                    Text(map)
                        .font(.subheadline)
                    
                }
                
            }
            .font(.custom(.customFont, size: 17))
            .foregroundColor(Color("TextContent"))
            
            Text(about)
                .font(.subheadline)
                .lineSpacing(6)
                .foregroundColor(Color("TextContent"))
                .fixedSize(horizontal: false, vertical: true)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct ProfileAboutView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            ProfileView(slug: "igyuguyg")
            
        }
    }
}
