//
//  PrimaryButton.swift
//  FoodMix
//
//  Created by Yuan on 14/03/2022.
//

import SwiftUI


struct PrimaryButtonView: View {
    
    var title: String
    @Binding var active: Bool
    
    var background: Color = Color("Primary")
    var height: CGFloat = 45
    var action: () -> Void
    
    @State private var animating: Bool = false
    var duration: Double = 0.4
    
    var body: some View {
        
        Button {
            
            action()
            
        } label: {
            
            HStack {
                
                Spacer()
                
                Text(title)
                    .fontWeight(.semibold)
                    .font(.caption)
                    .foregroundColor(.white)
                    .opacity(active ? 0 : 1)
                
                Spacer()
                
            }
            .frame(height: height)
            .background(background)
            .cornerRadius(15)
            .overlay(
                
                Group {
                    
                    if active {
                        
                        HStack(spacing: 10) {
                            
                            ForEach(1...3, id: \.self) { index in
                                
                                Circle()
                                    .fill(Color.white)
                                    .frame(width: 12, height: 12)
                                    .opacity(0.7)
                                    .scaleEffect(animating ? 1 : 0.3)
                                    .animation(.linear(duration: duration).repeatForever(autoreverses: true).delay(duration * Double(index) / Double(3) * 2), value: animating)
                                
                            }
                            
                            
                        }
                        .onAppear {
                            
                            animating.toggle()
                            
                        }
                        .onDisappear {
                            
                            animating.toggle()
                            
                        }
                        
                    }
                    
                }
            
            )
        }
        .background(background)
        .cornerRadius(15)
        .opacity(active ? 0.7 : 1)
        .buttonStyle(PlainButtonStyle())
        .disabled(active)
        
    }
    
}
