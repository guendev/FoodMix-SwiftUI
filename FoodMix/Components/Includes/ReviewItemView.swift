//
//  ReviewItemView.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI

struct ReviewItemView: View {
    
    @State var review: Review
    
    @State var limit: Bool = true
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(alignment: .top,spacing: 15) {
                
                NavigationLink( destination: ProfileView(slug: review.user!.slug)) {
                    RecipeAvatar(avatar: review.user?.avatar)
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .cornerRadius(50)
                }

                
                VStack(alignment: .leading, spacing: 3) {
                    
                    NavigationLink( destination: ProfileView(slug: review.user!.slug)) {
                        Text(review.user!.name)
                            .foregroundColor(Color("TextTitle"))
                            .font(.callout)
                            .lineLimit(1)
                    }

                    
                    StarRating(rating: 4.5, size: 13)
                    
                }
                
            }
            
            Text(review.content)
                .font(.subheadline)
                .lineSpacing(5)
                .lineLimit(limit ? 3 : nil)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color("TextContent"))
                .onTapGesture {
                    
                    
                    withAnimation {
                        limit.toggle()
                    }
                    
                }
                .withAlignment(alignment: .leading)
            
            Text(verbatim: .formatTime(review.createdAt))
                .font(.subheadline)
                .lineSpacing(5)
                .lineLimit(3)
                .opacity(0.8)
            
        }
        .padding()
        .background(Color("WhiteBackground"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
        
    }
    
    static func preview() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(alignment: .top,spacing: 15) {
                
                Image("avatar")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)

                
                VStack(alignment: .leading, spacing: 3) {
                    
                    Text("Nguyên Trần")
                        .foregroundColor(Color("TextTitle"))
                        .font(.callout)
                        .lineLimit(1)

                    
                    StarRating(rating: 4.5, size: 13)
                    
                }
                
            }
            
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book")
                .font(.subheadline)
                .lineSpacing(5)
                .lineLimit(3)
                .fixedSize(horizontal: false, vertical: true)
                .foregroundColor(Color("TextContent"))
            
            Text("20/20/2020")
                .font(.subheadline)
                .lineSpacing(5)
                .lineLimit(3)
                .opacity(0.8)
            
        }
        .padding()
        .background(Color("WhiteBackground"))
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
    }
    
    static func previews(_ count: Int = 3) -> some View {
        
        Group {
            
            ForEach(0...count, id: \.self) { _ in
                
                ReviewItemView.preview()
                
            }
            
        }
        .redacted(reason: .placeholder)
        
    }
}
