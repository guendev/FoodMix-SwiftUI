//
//  HomeTabView.swift
//  FoodMix
//
//  Created by Yuan on 30/03/2022.
//

import SwiftUI

struct HomeTabView: View {
    
    @State var currentTab: MainTab = .Home
    
    @Namespace var animation
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {

            
            Group {
                
                Button {
                    
                    withAnimation(.spring()) {
                        viewModel.showMenu.toggle()
                    }
                    
                } label: {
                    
                    ZStack {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 30, height: 3)
                            .rotationEffect(.degrees(45))
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 30, height: 3)
                            .rotationEffect(.degrees(45 + 90))
                    }
                    
                }
                .foregroundColor(.white)
                
                RecipeAvatar(avatar: "https://user-pic.webnovel.com/userheadimg/4319687705-10/100.jpg")
                    .scaledToFit()
                    .frame(width: 90, height: 90)
                    .cornerRadius(20)
                    .padding(.top, 40)
                
                Text("Nguyên Trần")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.top)
                    .lineLimit(2)
                    .lineSpacing(6)
                
                Text("Đầu bếp")
                    .padding(.top, 10)
                    .foregroundColor(.white)
                    .opacity(0.8)
                
            }
            .padding(.leading, 20)
            
            VStack(spacing: 10) {
                
                TabItemView(.Home, title: "Khám Phá")
                
                TabItemView(.Activity, title: "Xếp Hạng")
                
                TabItemView(.Notification, title: "Thông Báo")
                
                TabItemView(.Profile, title: "Cài Đặt")
                
            }
            .padding(.top, 30)
            
        }
        .frame(width: 190, alignment: .leading)
        .frame(maxHeight: .infinity, alignment: .topLeading)
    }
    
    @ViewBuilder
    private func TabItemView(_ tab: MainTab, title: String) -> some View {
        HStack(spacing: 15) {
            Image(tab.rawValue)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
            
        }
        .foregroundColor( viewModel.currentTab == tab ? Color("Primary") : .white)
        .padding(.horizontal, 20)
        .padding(.vertical, 13)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            Group {
                
                if viewModel.currentTab == tab {
                    
                    Color.white.clipShape(HomeTabViewShape())
                        .matchedGeometryEffect(id: "TAB_MAIN_ANIMATION", in: animation)
                    
                }
                
            }
        )
        .onTapGesture {
            withAnimation {
                viewModel.currentTab = tab
            }
        }
    }
}

struct HomeTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper {
                MainView()
            }
            //.environment(\.colorScheme, .dark)
        }
    }
}

struct HomeTabViewShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX - 20, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY - 20), control: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + 20))
        path.addQuadCurve(to: CGPoint(x: rect.maxX - 20, y: rect.minY), control: CGPoint(x: rect.maxX, y: rect.minY))
        return path
    }
}
