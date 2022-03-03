//
//  MainView.swift
//  FoodMix
//
//  Created by Yuan on 24/02/2022.
//

import SwiftUI
import Introspect

struct MainView: View {
    
    @StateObject var viewModel: MainViewModel = MainViewModel()
    
    @State var baseOffset: CGFloat = 280
    
    @Environment(\.colorScheme) var color
        
    var body: some View {
        
        ZStack(alignment: .topLeading) {
            
            ZStack {
                
                if viewModel.currentTab == .Home {
                    
                    HomeView()
                    
                } else if viewModel.currentTab == .Notification {
                    
                    NotificationView()
                    
                } else if viewModel.currentTab == .Activity {
                    
                    ActivityView()
                    
                } else {
                    
                    SettingView()
                    
                }
                
            }
            .padding(.horizontal, viewModel.showMenu ? 10 : 0)
            .padding(.vertical, viewModel.showMenu ? 20 : 0)
            .background(Color("Background").cornerRadius(20))
            .offset(x: viewModel.showMenu ? baseOffset : 0)
            .scaleEffect(viewModel.showMenu ? 0.9 : 1)
            .zIndex(1)
            .disabled(viewModel.showMenu)
            .onTapGesture {
                if viewModel.showMenu {
                    withAnimation(.spring()) {
                        viewModel.showMenu.toggle()
                    }
                }
            }
            
            Color.white
                .cornerRadius(viewModel.showMenu ? 20 : 0)
                .offset(x: viewModel.showMenu ? baseOffset - 30 : 0)
                .scaleEffect(viewModel.showMenu ? 0.83 : 1)
                .opacity(viewModel.showMenu ? 0.7 : 0)
                .zIndex(0)
            
            Color.white
                .cornerRadius(viewModel.showMenu ? 20 : 0)
                .offset(x: viewModel.showMenu ? baseOffset - 60 : 0)
                .scaleEffect(viewModel.showMenu ? 0.75 : 1)
                .opacity(viewModel.showMenu ? 0.7 : 0)
                .zIndex(0)
            
            HomeTabView()
                .offset(x: viewModel.showMenu ? 0 : -190)
        }
        .background(
            Color("Primary").ignoresSafeArea()
                .opacity( viewModel.showMenu ? 1 : 0)
        )
        .environmentObject(viewModel)
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper {
                MainView()
            }
            //.environment(\.colorScheme, .dark)
        }
    }
}

struct MainTabShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius = rect.maxY / 2


        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.minY))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + radius), control: CGPoint(x: rect.minX, y: rect.minY))
            
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX - radius, y: rect.minY), control: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
}


enum MainTab: String, CaseIterable {
    case Home = "Home"
    case Activity = "Activity"
    case Notification = "Notification"
    case Profile = "Profile"
}

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}

