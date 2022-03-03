//
//  CategoriesView.swift
//  FoodMix
//
//  Created by Yuan on 02/03/2022.
//

import SwiftUI

struct CategoriesView: View {
    
    var categories: [Category]
    
    @State var show: Bool = false
    @Namespace var animation
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
    
    var body: some View {
        
        VStack(spacing: 10) {
            
            HStack {
                
                Button {
                    
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    
                    Image(systemName: "arrow.left")
                        .foregroundColor(Color("TextTitle"))
                    
                }
                
                Text("Phân Nhóm")
                    .font(.title2)
                    .foregroundColor(Color("TextTitle"))
                
                Spacer()
                
            }
            .foregroundColor(.black.opacity(0.7))
            .padding(.vertical)
            .padding(.horizontal, 25)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                LazyVStack(alignment: .leading, spacing: 40) {
                    
                    ForEach((0...categories.count - 1), id: \.self) { index in
                        
                        NavigationLink( destination: CategoryView(category: categories[index])) {
                            CategoryItemView(item: categories[index], index: index)
                            
                        }

                        
                    }
                    
                }
                
            }
            .padding(.horizontal, 25)
            
        }
        .background(Color("Background").ignoresSafeArea())
        .onAppear {
            
            DispatchQueue.main.async {
                show = true
            }
            
        }
        
        
    }
    
    func getDelay(index: Int) -> Double {
        return 0.4 +  Double(index + 1) * 0.2
    }
    
    @ViewBuilder
    private func CategoryItemView(item: Category, index: Int) -> some View {
        
        HStack(alignment: .top) {
            
            VStack(alignment: .leading, spacing: 10) {
                
                Text("\(item.name)")
                    .foregroundColor(Color("TextTitle"))
                    .font(.title2)
                
                Text("Để có một chế độ ăn hợp lý bạn đừng quên 5 nhóm thực phẩm cần thiết phải có trong các bữa ăn hàng ngày.")
                    .multilineTextAlignment(.leading)
                    .lineSpacing(6)
                    .foregroundColor(Color("TextContent"))
                
                
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("12")
                .padding(5)
                .background(Color("Background2"))
                .foregroundColor(Color("TextContent"))
                .cornerRadius(10)
            
        }
        .padding(.leading, 60)
        .overlay(
            
            RecipeAvatar(avatar: item.icon)
                .scaledToFit()
                .frame(width: 50, height: 50)
                .scaleEffect(show ? 1 : 0.5)
                .animation(.spring().delay(getDelay(index: index) + 0.1), value: show)
            
            ,alignment: .topLeading
            
        )
        .overlay(
            
            Rectangle()
                .fill(Color("TextContent").opacity(0.1))
                .frame(height: 2)
                .frame(maxWidth: getScreenBounds().width - 20 * 2 - 60 - 5)
                .offset(y: 20)
            
            ,alignment: .bottomTrailing
            
        )
        .opacity(show ? 1 : 0)
        .offset(y: show ? 0 : 50)
        .animation(.spring().delay(getDelay(index: index)), value: show)
        
    }
}

struct CategoriesView_Previews: PreviewProvider {

    
    static var previews: some View {
        
        Group {
            PreviewWrapper {
                
                HomeView()
                
            }
            PreviewWrapper {
                
                HomeView()
                
            }
            .environment(\.colorScheme, .dark)
        }
        
    }
}

