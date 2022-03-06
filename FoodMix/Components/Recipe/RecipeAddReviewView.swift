//
//  RecipeAddReviewView.swift
//  FoodMix
//
//  Created by Yuan on 17/03/2022.
//

import SwiftUI
import Introspect

struct RecipeAddReviewView: View {
    
    @State var recipe: Recipe
    
    @State private var show: Bool = false
    
    @Environment(\.presentationMode) var presentationMode
    
    
    @State var points: [StarRatingPoint] = [
        StarRatingPoint(name: "Hướng Dẫn Có Tâm"),
        StarRatingPoint(name: "Món Ăn Dễ Nấu"),
        StarRatingPoint(name: "Nguyên Liệu Dễ Tìm"),
        StarRatingPoint(name: "Giá Thành Thực Hiện")
    ]
    
    @State var rating: Double = .zero
    @State var errorRating: String = ""
    
    @State var content: String = ""
    @State var errorContent: String = ""
    
    @State var loading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            
            VStack(alignment: .leading, spacing: 15){
                
                HStack(spacing: 25) {
                    
                    Text("Thêm đánh giá")
                        .font(.system(size: 30))
                        .foregroundColor(Color("TextTitle"))
                        .offset(x: 0, y: show ? 0 : 30)
                        .opacity(show ? 1 : 0)
                        .animation(.spring(), value: show)
                    
                    Spacer()
                    
                    Button {
                        
                        withAnimation {
                            presentationMode.wrappedValue.dismiss()
                        }
                        
                    } label: {
                        
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray.opacity(0.4))
                        
                    }
                    .scaleEffect(show ? 1 : 0.1)
                    .opacity(show ? 1 : 0)
                    .animation(.spring().delay(0.2), value: show)
                    
                }
            }
            .padding(.horizontal, 25)
            .withAlignment(alignment: .leading)
            .padding(.top)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 25) {
                    
                    VStack(spacing: 20) {
                        
                        ForEach(0...3, id: \.self) { index in
                            
                            RatingOptionView(index: index, subject: points[index])
                                .offset(x: 0, y: show ? 0 : 30)
                                .opacity(show ? 1 : 0)
                                .animation(.spring().delay(0.2 + 0.2 * Double(index)), value: show)
                            
                        }
                        
                        HStack {
                            
                            Image(systemName: "bolt")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 14, height: 14)
                            
                            Text("Điểm đánh giá")
                                .font(.caption)
                            
                            Spacer()
                            
                        }
                        .padding()
                        .foregroundColor(Color("TextContent"))
                        .background(Color("Background2"))
                        .cornerRadius(10)
                        .overlay(
                            
                            HStack(spacing: 5) {
                                
                                Text(String(format: "%.1f", rating / 4))
                                    .font(.caption)
                                
                                Image(systemName: "star")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                
                            }
                                .padding(6)
                                .padding(.horizontal, 5)
                                .foregroundColor(.white)
                                .background(Color("Primary"))
                                .cornerRadius(7)
                                .offset(x: -15)
                            
                            ,alignment: .trailing
                        
                        )
                        .offset(x: 0, y: show ? 0 : 30)
                        .opacity(show ? 1 : 0)
                        .animation(.spring().delay(0.2 + 0.2 * Double(points.count)), value: show)
                        
                    }
                    .withErrorForm(msg: $errorRating)
                    
                    TextEditor(text: $content)
                        .frame(height: 250)
                        .font(.subheadline)
                        .foregroundColor(Color("TextContent"))
                        .accentColor(Color("TextContent"))
                        .introspectTextView { uiTextField in
                            uiTextField.textContainerInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
                            uiTextField.backgroundColor = UIColor(Color("Background2"))
                            uiTextField.layer.cornerRadius = 15
                        }
                        .overlay(
                            
                            Group {
                                
                                if content == "" {
                                    
                                    Text("Nhập đánh giá của bạn. Tối thiểu 50 ký tự và đừng spam bạn nhé")
                                        .font(.subheadline)
                                        .foregroundColor(Color("TextContent").opacity(0.7))
                                        .padding(20)
                                    
                                }
                                
                            }
                            ,alignment: .topLeading
                            
                        )
                        .withErrorForm(msg: $errorContent)
                        .offset(x: 0, y: show ? 0 : 30)
                        .opacity(show ? 1 : 0)
                        .animation(.spring().delay(0.2 + 0.2 * Double(points.count + 1)), value: show)
                    
                }
                
                PrimaryButtonView(title: "Gửi Đánh Giá", active: $loading) {
                    
                    addReview()
                    
                }
                .padding(.top)
                .offset(x: 0, y: show ? 0 : 30)
                .opacity(show ? 1 : 0)
                .animation(.spring().delay(0.2 + 0.2 * Double(points.count + 2)), value: show)
                
            }
            .padding(.horizontal, 25)
        }
        .background(Color("Background").ignoresSafeArea())
        .initView {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
               show = true
            }
        }
    }
    
    @ViewBuilder
    func RatingOptionView(index: Int, subject: StarRatingPoint) -> some View {
        
        HStack {
            
            Text(subject.name)
                .font(.subheadline)
                .foregroundColor(Color("TextTitle"))
            
            Spacer()
            
            HStack(spacing: 10) {
                
                ForEach(1...5, id: \.self) { item in
                    
                    Button {
                        
                        setPoint(index: index, point: item)
                        
                    } label: {
                        
                        Image(systemName: "star.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 15, height: 15)
                        
                    }
                    .foregroundColor(subject.point >= item ? Color("Primary") : Color("Background2"))
                    .animation(.linear)
                    
                }

                
            }
            
        }
        
    }
    
    func setPoint(index: Int, point: Int) -> Void {
        
        points[index].point = point
        
        rating = Double(points.reduce(0) { $0 + $1.point })
        
    }
    
    func addReview() -> Void {
        
        if content.count < 50 {
            errorContent = "Đánh giá phải trên 50 ký tự"
        }
        
        if points.filter({ point in return point.point == 0 }).count > 0 {
            errorRating = "Bạn phải chọn tất cả tiêu chí"
        }
        
        if !errorRating.isEmpty || !errorContent.isEmpty {
            return
        }
        
        loading = true
        
        let input = AddReviewInput(content: content, totalRating: "\(rating)")
        Network.shared.apollo.perform(mutation: AddReviewMutation(id: recipe.slug, input: input)) { result in
            
            switch result {
            case .success(let graphQLResult) :
                                
                if graphQLResult.errors != nil {
                    break
                }
                
                loading = false
                presentationMode.wrappedValue.dismiss()
                break
                
            case .failure(_):
                break                // Lỗi mạng
            }
            
        }
        
    }
}

struct StarRatingPoint: Identifiable {
    var id = UUID().uuidString
    let name: String
    var point: Int = 0
}
