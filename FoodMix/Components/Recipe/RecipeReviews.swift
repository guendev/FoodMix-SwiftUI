//
//  RecipeReviews.swift
//  FoodMix
//
//  Created by Yuan on 16/03/2022.
//

import SwiftUI

struct RecipeReviews: View {
    
    @EnvironmentObject var viewModel: RecipeViewModel

    @State var showReviewSheet: Bool = false
        
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
            
            TitleView(title: "Đánh Giá") {
                
                Text("Xem thêm")
                    .font(.custom(.customFont, size: 14))
                    .foregroundColor(.gray)
                
            }
            
            Button {
                
                showReviewSheet = true
                
            } label: {
                
                HStack {
                    
                    Image(systemName: "paperplane")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 14, height: 14)
                    
                    Text("Thêm đánh giá")
                        .font(.caption)
                    
                    Spacer()
                    
                    Image(systemName: "arrow.right")
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 14, height: 14)
                    
                }
                .padding()
                .foregroundColor(Color("TextContent"))
                .background(Color("Background2"))
                .cornerRadius(25)
                
            }
            .sheet(isPresented: $showReviewSheet) {
                
                RecipeAddReviewView(recipe: viewModel.recipe!)
                
            }


            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    Group {
                        
                        ForEach(viewModel.reviews, id: \.id) { review in
                            
                            ReviewItemView(review: review)
                            
                        }
                        
                    }
                    
                    if viewModel.loadingReviews || viewModel.recipe == nil {
                                            
                        ReviewItemView.previews(2)
                        
                    }
                    
                    if viewModel.emptyReviews {
                        
                        EmptyContent()
                            .withAlignment(alignment: .center)
                        
                    }
                    
                }
                
            }
            
        }
        .initView {
            // limit lại
            viewModel.reviewLimit = 3
            viewModel.getReviews {
                viewModel.subNewReviewAction()
            }
        }
        
    }
    
}

struct RecipeReviews_Previews: PreviewProvider {
    static var previews: some View {
        
        Group {
            PreviewWrapper {
                
                RecipeView(slug: "le-thi-kim-ngan")
                
            }
        }
        
    }
}
