//
//  SearchHistory.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI
import CoreData

struct SearchHistoryView: View {
    
    @FetchRequest(sortDescriptors: [ NSSortDescriptor(keyPath: \SearchHistory.createdAt, ascending: false) ]) var histories: FetchedResults<SearchHistory>
    @Environment(\.managedObjectContext) var viewContext
    
    @State private var refreshingID = UUID()
    
    @State var animation: Bool = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            TitleView(title: "Lịch Sử") {
                if histories.count > 0 {
                    Button {
                        
                        withAnimation {
                            
                            removeHistories()
                            
                        }
                        
                    } label: {
                        
                        Text("Xoá hết")
                            .font(.custom(.customFont, size: 14))
                            .foregroundColor(.gray)
                        
                    }
                }
            }
            
            if histories.count > 0 {
                VStack(spacing: 15) {
                    
                    ForEach(histories, id: \.objectID) { (student: SearchHistory) in
                            
                        
                        HStack {
                            
                            Button {
                                
                            } label: {
                                
                                Text(student.keyword ?? "Unknown")
                                    .font(.subheadline)
                                    .foregroundColor(Color("TextContent"))
                                    .lineLimit(1)
                                
                                
                            }
                            
                            Spacer()
                            
                            Button {
                                
                                remove(history: student)
                                
                            } label: {
                                
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.black.opacity(0.7))
                                        .frame(width: 10, height: 1)
                                        .rotationEffect(Angle(degrees: animation ? 125 : 0))
                                    
                                    RoundedRectangle(cornerRadius: 5)
                                        .fill(Color.black.opacity(0.7))
                                        .frame(width: 10, height: 1)
                                        .rotationEffect(Angle(degrees: animation ? 45 : 0))
                                    
                                }
                                
                            }
                            
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                    .id(refreshingID)
                    
                }
            } else {
                
                VStack {
                    
                    Image("history")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 280)
                    
                    Text("Mọi thứ sẽ được lưu lại")
                        .font(.subheadline)
                        .foregroundColor(Color("TextContent"))
                    
                }
                
            }
            
            
        }
        .onAppear {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.spring()) {
                    animation = true
                }
            }
            
        }
        
    }
    
    private func remove(history: SearchHistory) -> Void {
        
        withAnimation(.spring()) {
            viewContext.delete(history)
            try? viewContext.save()
        }
        
    }
    
    private func removeHistories() -> Void {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchHistory")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        _ = try? viewContext.execute(batchDeleteRequest)
        
        viewContext.reset()
        refreshingID = UUID()
        
    }
}

struct SearchHistory_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}
