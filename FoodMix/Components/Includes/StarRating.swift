//
//  StarRating.swift
//  FoodMix
//
//  Created by Yuan on 26/02/2022.
//

import SwiftUI

struct StarRating: View {
    
    @State var rating: Double
    var size: CGFloat = 20
    var activeColor: Color = .yellow
    var disableColor: Color = .gray.opacity(0.3)
    var spacing: CGFloat = 6
    
    var body: some View {
        
        HStack(spacing: spacing) {
            
            
            ForEach((1...5), id: \.self) { index in
                
                Image(systemName: buildStar(_rating: Double(index)))
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(pass(_rating: Double(CGFloat(Double(index)))) ? activeColor : disableColor)
                    .frame(width: size, height: size)
                
            }
            
        }
        
    }
    
    func buildStar(_rating: Double) -> String {
        
        if rating >= _rating {
            return "star.fill"
        } else if _rating > rating && rating + 0.5 >= _rating {
            return "star.leadinghalf.fill"
        }
        
        return "star.fill"
    }
    
    func pass(_rating: Double) -> Bool {
        return rating >= _rating || (_rating > rating && rating + 0.5 >= _rating)
    }
}

struct StarRating_Previews: PreviewProvider {
    static var previews: some View {
        StarRating(rating: 3.5)
    }
}
