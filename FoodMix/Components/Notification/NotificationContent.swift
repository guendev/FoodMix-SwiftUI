//
//  NotificationContent.swift
//  FoodMix
//
//  Created by Yuan on 17/03/2022.
//

import SwiftUI

struct NotificationContent: View {
    
    @StateObject var viewModel: NotificationViewModel = NotificationViewModel()
    

    var body: some View {
        
        VStack(spacing: 25) {
            
            
            ForEach(viewModel.noties, id: \.id) { item in
                
                NotificationItem(notify: item)
                
            }
            
            if viewModel.loading {
                NotificationItem.previews()
            }
            
            if viewModel.empty {
                
                EmptyContent()
                
            } else {
                
                PrimaryButtonView(title: "Xem Thêm", active: $viewModel.loading) {
                    viewModel.getNotifies()
                }
                
            }
        }
        
    }
    
}

struct NotificationContent_Previews: PreviewProvider {
    static var previews: some View {
        
        PreviewWrapper {
            
            NotificationView()
            
        }
        .environment(\.colorScheme, .dark)
        
    }
}
