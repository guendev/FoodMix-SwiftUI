//
//  RecipeStretchAvatar.swift
//  FoodMix
//
//  Created by Yuan on 28/02/2022.
//

import SwiftUI

struct RecipeStretchAvatar: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel
    
    @State var checked: Bool = false
    
    @Environment(\.authKey) var auth
        
    var body: some View {
        GeometryReader { geo in
            
            ZStack(alignment: .bottom) {
                
                Color("AvavtarBackground")
                    .overlay(
                        Group {
                            
                            if !viewModel.ready {
                                
                                Image("food")
                                    .resizable()
                                    .scaledToFill()
                                
                            } else {
                                
                                RecipeAvatar(avatar: viewModel.recipe!.avatar)
                                    .scaledToFill()
                                
                            }
                            
                        }
                    )
                    .clipShape(RecipeClip())
                
            }
            .frame(width: geo.frame(in: .global).width)
            .frame(height: 350 + viewModel.stretchHeight)
            .offset(y: -viewModel.stretchHeight)
            .onChange(of: geo.frame(in: .global), perform: { value in
                scaleHeight(geo.frame(in: .global))
            })
            
        }
        .frame(height: 350)
        .overlay(
            
            Button {
        
                viewModel.bookmarkAction()
                
            } label: {
                                                        
                Group {
                    if viewModel.bookmarked != nil {
                        Image(systemName: "heart.fill")
                            .resizable()
                            .scaledToFit()
                    } else {
                        
                        Image(systemName: "heart")
                            .resizable()
                            .scaledToFit()
                        
                    }
                }
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .frame(width: 45, height: 45)
                .background(Color("Rose"))
                .clipShape(Circle())
                
            }
                .disabled(!viewModel.ready)
                .offset(x: -30, y: -30)
                .withAuth()
            
            ,alignment: .bottomTrailing
            
        )
        .redacted(reason: viewModel.ready ? [] : .placeholder)
    }
    
    func scaleHeight(_ rect: CGRect) -> Void {
        viewModel.stretchHeight = rect.minY >= 0 ? rect.minY : 0
        viewModel.offset = rect.minY
    }
}

struct RecipeStretchAvatar_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            RecipeView(slug: "le-thi-kim-ngan")
            
        }
    }
}

struct RecipeClip: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let radius = CGFloat(50)
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
       
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY - radius * 2))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX + radius, y: rect.maxY - radius), control: CGPoint(x: rect.minX, y: rect.maxY - radius))
        
        path.addLine(to: CGPoint(x: rect.maxX - radius, y: rect.maxY - radius))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.maxY - radius))
        
        // path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        return path
    }
    
}
