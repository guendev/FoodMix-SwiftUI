//
//  CheckBoxView.swift
//  FoodMix
//
//  Created by Yuan on 13/03/2022.
//

import SwiftUI

struct CheckBoxView: View {
    
    @Environment(\.checkBoxStyle) private var style
    
    var current: Bool
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: style.radius)
            .stroke(style.primary, lineWidth: style.radius)
            .background(
                RoundedRectangle(cornerRadius: style.radius)
                    .fill(style.primary)
                    .rotationEffect(Angle(degrees: current ? 0 : 90), anchor: .bottomTrailing)
                    .animation(.spring(), value: current)
                
            )
            .overlay(
                
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.white)
                    .frame(width: style.imageSize, height: style.imageSize)
                    .scaleEffect(current ? 1 : 0.1)
                    .animation(.spring().delay(0.2), value: current)
            )
            .clipShape(RoundedRectangle(cornerRadius: style.radius))
            .frame(width: style.size, height: style.size)
        
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(current: false)
    }
}


struct CheckBoxStyle {
    var primary: Color = Color("Primary")
    var anchor: UnitPoint = .bottomTrailing
    var size: CGFloat = 18
    
    var radius: CGFloat {
        get {
            return size / 6
        }
    }
    
    var imageSize: CGFloat {
        get {
            return size * 0.6
        }
    }
}


// 1. Create the key with a default value
private struct CheckBoxStyleKey: EnvironmentKey {
    static let defaultValue: CheckBoxStyle = CheckBoxStyle()
}

// 2. Extend the environment with our property
extension EnvironmentValues {
    
    var checkBoxStyle: CheckBoxStyle {
        get { self[CheckBoxStyleKey.self] }
        set { self[CheckBoxStyleKey.self] = newValue }
    }
    
}
