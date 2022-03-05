//
//  CategoryAboutView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI

struct CategoryAboutView: View {
    
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("\(category.name)")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(Color("TextTitle"))
                .frame(maxWidth: getScreenBounds().width - 170, alignment: .leading)
            
            Text(category.content ?? "")
                .font(.subheadline)
                .foregroundColor(Color("TextContent"))
                .lineSpacing(7)
            
        }
    }
}



struct CategoryAboutView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: Category(id: "1", name: "Gà Quay", slug: "ga-quay", avatar: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFKYmf6jHItCbfL8txsSCFfsCW254JYLEeNQ&usqp=CAU", content: "You can change your ContentView body in this way, and when you dismiss the sheet view, it will navigate to DashboardView", icon: "https://i.imgur.com/sJapZxD.png"))
    }
}
