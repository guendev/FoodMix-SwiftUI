//
//  SearchView.swift
//  FoodMix
//
//  Created by Yuan on 04/03/2022.
//

import SwiftUI
import CoreData

struct SearchBarView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var viewModel: SearchViewModel
    
    @Environment(\.managedObjectContext) var viewContext
        
    
    var body: some View {
        
        HStack {
            
            Button {
                
                presentationMode.wrappedValue.dismiss()
                
            } label: {
                
                Image(systemName: "arrow.left")
                    .foregroundColor(Color("TextContent"))
                
            }
            
            
            TextField("Tìm kiếm", text: $viewModel.keyword) { _ in
                    
            } onCommit: {
                viewModel.searchDebounce {
                    saveHistory()
                }
            }
            .primaryInput(icons: [.trailing], radius: 20)
            .overlay(
                    
                Button {
                        
                    viewModel.keyword = ""
                        
                } label: {
                        
                    Image(systemName: "xmark")
                    .resizable()
                    .foregroundColor(Color("TextContent"))
                    .frame(width: 10, height: 10)
                        .padding()
                        
                }
                .scaleEffect(viewModel.keyword == "" ? 0 : 1)
                .animation(.spring())
                    
                ,alignment: .trailing
                    
            )
            .onChange(of: viewModel.keyword) { _ in
                viewModel.searchDebounce {
                    // saveHistory()
                }
                DispatchQueue.main.asyncDeduped(target: SearchHistory.self, after: 5) {
                    saveHistory()
                }
            }
            
            
        }
        .padding(.horizontal, 25)
        .onAppear {
            viewModel.keyword = "b"
        }
        
    }
    
    private func saveHistory() -> Void {
        
        if viewModel.keyword == "" {
            return
        }
        
        // kiểm tra lịch sử
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchHistory")
        
        fetchRequest.predicate = NSPredicate(format: "keyword == %@", viewModel.keyword.trimmingCharacters(in: .whitespacesAndNewlines))
        
        
        if (try? viewContext.fetch(fetchRequest).first) != nil { return }
                
        let record = SearchHistory(context: viewContext)
        record.createdAt = Int32(NSDate().timeIntervalSince1970)
        record.keyword = viewModel.keyword
        
        _ = try? viewContext.save()
        
        limitHistory()
        
    }
    
    private func limitHistory() {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "SearchHistory")
        fetchRequest.sortDescriptors = [ NSSortDescriptor(keyPath: \SearchHistory.createdAt, ascending: false) ]
        
        let histories = try? viewContext.fetch(fetchRequest)
        
        if histories!.count < 4 { return }
        
        viewContext.delete(histories!.last as! NSManagedObject)
        
        try? viewContext.save()
        
    }
}

struct SearchBarView_Previews: PreviewProvider {
        
    static var previews: some View {
        PreviewWrapper {
            
            SearchView()
            
        }
    }
}
