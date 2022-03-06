//
//  ProfileReviewsView.swift
//  FoodMix
//
//  Created by Yuan on 15/03/2022.
//

import SwiftUI

struct ProfileReviewsView: View {
    
    @EnvironmentObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            ForEach(viewModel.reviews) { review in
                
                ProfileReviewItem(review: review)
                
            }
            
            ProfileReviewItem.previews()
            
        }
        
    }
    
}

struct ProfileReviewItem: View {
    
    var review: Review
    
    @State var limit: Bool = true
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(alignment: .top,spacing: 15) {
                
                RecipeAvatar(avatar: review.user?.avatar)
                    .scaledToFit()
                    .frame(width: 50, height: 50)
                    .cornerRadius(50)
                
                VStack(alignment: .leading, spacing: 3) {
                    
                    Text(review.user!.name)
                        .foregroundColor(Color("TextTitle"))
                        .font(.callout)
                        .lineLimit(1)
                    
                    StarRating(rating: 4.5, size: 13)
                    
                }
                
            }
            
            Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and as little code as possible. With SwiftUI, you can bring even better experiences to all users, on any Apple device, using just one set of tools and APIs.")
                .font(.subheadline)
                .lineSpacing(5)
                .lineLimit(limit ? 3 : nil)
                .foregroundColor(Color("TextContent"))
                .onTapGesture {
                    
                    withAnimation {
                        limit.toggle()
                    }
                    
                }
            
            Divider()
            
            NavigationLink(destination: RecipeView(slug: review.recipe!.slug)) {
                RecipeAvatar(avatar: review.recipe?.avatar)
                    .scaledToFit()
                    .clipped()
                    .cornerRadius(10)
            }

            
            
            HStack {
                
                
                Image(systemName: "message")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                
                
                Text(review.recipe!.name)
                    .font(.callout)
                    .lineLimit(1)
                
                Spacer()
                
                Text(verbatim: .formatTime(review.createdAt))
                    .font(.subheadline)
                    .lineSpacing(5)
                    .lineLimit(3)
                    .opacity(0.8)
            }
            .foregroundColor(Color("TextContent"))
            .padding(.top, 5)
            
        }
        .withAlignment(alignment: .leading)
        .padding(20)
        .background(Color("Background2"))
        .cornerRadius(20)
        
    }
    
    @ViewBuilder
    static func previews(_ count: Int = 4) -> some View {
        
        Group {
            
            ForEach(0...count, id: \.self) { _ in
                
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
                    
                    Text("SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and as little code as possible. With SwiftUI, you can bring even better experiences to all users, on any Apple device, using just one set of tools and APIs.")
                        .font(.subheadline)
                        .lineSpacing(5)
                        .lineLimit(3)
                        .foregroundColor(Color("TextContent"))
                    
                    Divider()
                    
                    Image("food")
                        .resizable()
                        .scaledToFit()
                        .clipped()
                        .cornerRadius(10)

                    
                    
                    HStack {
                        
                        
                        Image(systemName: "message")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                        
                        
                        Text("Chạm Vào Giai Điệu")
                            .font(.callout)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        Text("20/20/2021")
                            .font(.subheadline)
                            .lineSpacing(5)
                            .lineLimit(3)
                            .opacity(0.8)
                    }
                    .foregroundColor(Color("TextContent"))
                    .padding(.top, 5)
                    
                }
                .withAlignment(alignment: .leading)
                .padding(20)
                .background(Color("Background2"))
                .cornerRadius(20)
                
            }
            
        }
        .redacted(reason: .placeholder)
        
    }

    
}

struct ProfileReviewsView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            ProfileReviewItem(review: Review(
                id: "6214877f810728861c0b2329",
                user: User(
                    id: "6211bc6c51c56521e3c8a693",
                    name: "Nguyên",
                    email: "nstylish9@gmail.com",
                    slug: "nguyen",
                    avatar: "https://i.imgur.com/pqGLgGr.jpg"
                ),
                recipe: Recipe(
                    id: "6211bef12e4cb63fa5bcfd4d",
                    name: "Bún sườn mọc chua",
                    slug: "bun-suon-moc-chua",
                    avatar: "https://cdn.tgdd.vn/2021/03/CookProduct/bunmocchangio-1200x676.jpg",
                    countRating: 1,
                    totalRating: 10
                ),
                content: "SwiftUI helps you build great-looking apps across all Apple platforms with the power of Swift — and as little code as possible. With SwiftUI, you can bring even better experiences to all users, on any Apple device, using just one set of tools and APIs.",
                totalRating: 10,
                createdAt: 1645512575615
            )
          )
                .padding(.horizontal, 25)
            
        }
    }
}
