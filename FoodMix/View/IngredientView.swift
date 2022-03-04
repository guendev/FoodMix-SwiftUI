//
//  IngredientView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct IngredientView: View {
    
    @StateObject var viewModel: IngredientViewModel = IngredientViewModel()
    
    @State private var show: Bool = false
    
    var ingredient: IngredientItem
    
    var colors: [Color] = [.red, .blue, .green, .orange]
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            VStack(alignment: .leading, spacing: 15){
                
                HStack(spacing: 25) {
                    
                    Text(ingredient.name)
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
                    .scaleEffect(show ? 1 : 0)
                    .opacity(show ? 1 : 0)
                    .animation(.spring().delay(0.2), value: show)
                    
                }
                
                Text(ingredient.content)
                    .lineSpacing(6)
                    .lineLimit(2)
                    .foregroundColor(Color("TextContent"))
                    .offset(x: 0, y: show ? 0 : 30)
                    .opacity(show ? 1 : 0)
                    .animation(.spring().delay(0.2), value: show)
            }
            .padding(.horizontal, 25)
            .withAlignment(alignment: .leading)
            .padding(.top)
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 30) {
                    
                    HStack(alignment: .top) {
                        
                        VStack(alignment: .leading) {
                            
                            Text("Đặc Tính")
                                .font(.custom(.customFont, size: 22))
                                .foregroundColor(Color("TextTitle"))
                                .offset(x: 0, y: show ? 0 : 30)
                                .opacity(show ? 1 : 0)
                                .animation(.spring().delay(0.4), value: show)
                            
                            if ingredient.properties.count > 0 {
                                
                                ForEach((0...ingredient.properties.count - 1), id: \.self) { index in
                                    
                                    HStack {
                                        
                                        Circle()
                                            .fill(getColor())
                                            .frame(width: 30, height: 30)
                                            .overlay(
                                                
                                                Text("\(index + 1)")
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.white)
                                            )
                                            .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                                        
                                        Text(ingredient.properties[index])
                                        
                                    }
                                    .padding(.top)
                                    .offset(x: 0, y: show ? 0 : 30)
                                    .opacity(show ? 1 : 0)
                                    .animation(.spring().delay(getDelay(index: index)), value: show)
                                    
                                }
                                
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        RecipeAvatar(avatar: ingredient.image)
                            .scaledToFit()
                            .frame(width: 150, height: 150)
                            .scaleEffect(show ? 1 : 0.5)
                            .opacity(show ? 1 : 0)
                            .animation(.spring().delay(0.6), value: show)
                            .shadow(color: .black.opacity(0.05), radius: 10, x: 0.0, y: 0.0)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    }
                    
                    TitleView(title: "Món Ăn Sử Dụng") {
                        Text("Xem thêm")
                            .font(.custom(.customFont, size: 14))
                            .foregroundColor(.gray)
                    }
                    .offset(x: 0, y: show ? 0 : 30)
                    .opacity(show ? 1 : 0)
                    .animation(.spring().delay(getDelay(index: ingredient.properties.count)), value: show)
                    
                    // Danh sách mon ăn
                    
                    VStack(spacing: 25) {
                        
                        ForEach(viewModel.recipes) { item in
                            
                            NavigationLink( destination: RecipeView(slug: item.slug)) {
                                RecipeItemHorizontal(recipe: item)
                            }

                            
                        }
                        
                        if viewModel.loading {
                            
                            RecipeItemHorizontalPreview.preview()
                            
                        }
                        
                        if viewModel.empty {
                            
                            EmptyContent()
                            
                        } else {
                            
                            PrimaryButtonView(title: "Xem Thêm", active: $viewModel.loading) {
                                
                                viewModel.getRecipes()
                                
                            }
                            
                        }
                        
                    }
                    .offset(x: 0, y: show ? 0 : 30)
                    .opacity(show ? 1 : 0)
                    .animation(.spring().delay(0.6), value: show)
                    
                }
                
            }
            .padding([.horizontal], 25)
            
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
               show = true
            }
            
        }
        .initView {
            viewModel.ingredient = ingredient
            viewModel.getRecipes()
        }
        .background(Color("Background").ignoresSafeArea())
    }
    
    func getColor() -> Color {
        return colors.randomElement()!
    }
    
    func getDelay(index: Int) -> Double {
        return 0.4 +  Double(index + 1) * 0.2
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientView(ingredient: IngredientItem(
                        id: "3",
                        name: "Ngò",
                        image: "https://i.imgur.com/GvqcfUs.png",
                        content: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                        properties: ["Rau Mùi Vị", "Dễ Sử Dụng", "Giá Rẻ"]
        ))
            .environment(\.colorScheme, .dark)
    }
}
