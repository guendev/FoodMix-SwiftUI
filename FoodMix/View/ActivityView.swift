//
//  ActivityView.swift
//  FoodMix
//
//  Created by Yuan on 27/02/2022.
//

import SwiftUI

struct ActivityView: View {
    
    @StateObject var viewModel: ActivityViewModel = ActivityViewModel()
    @EnvironmentObject var mainApp: MainViewModel
    
    @State var getFirst: Bool = false
            
    var body: some View {
        
        VStack(alignment: .leading) {
            ActivityAppBar()
                .padding(.horizontal, 25)
            
            ActivityBigTop()
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .background(Color("Background").ignoresSafeArea())
        .overlay(
        
            ActivityListAuthor()
                .frame(width: getScreenBounds().width)
                .background(Color("WhiteBackground").cornerRadius(20))
                .clipShape(CustomSheetShape())
                .offset(y: 30)
            
            ,alignment: .bottom
        )
        .environmentObject(viewModel)
    }

}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PreviewWrapper {
                
                MainView()
                
            }
            .environment(\.colorScheme,  .dark)
        }
    }
}
