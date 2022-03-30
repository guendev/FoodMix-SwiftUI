//
//  Toastify.swift
//  FoodMix
//
//  Created by Yuan on 05/03/2022.
//

import SwiftUI

@available(iOS 13.0, *)
struct Toastify {
    
    static func show(_ title: String, image: String? = nil, foregroundColor: Color = .white, background: Color = Color("Primary")) -> Void {
        
        if getRootController().view.subviews.contains(where: { view in
            return view.tag == 1009
        }) {
            return
        }
        
        let notifyViewController = UIHostingController(rootView: ToastifyView(title: title, image: image, foregroundColor: foregroundColor, background: background))
        
        let size = notifyViewController.view.intrinsicContentSize
        
        notifyViewController.view.frame.size = size
        notifyViewController.view.frame.origin = CGPoint(x: getScreenBounds().midX - size.width / 2, y: 50)
        notifyViewController.view.backgroundColor = .clear
        
        notifyViewController.view.tag = 1009
        
        getRootController().view.addSubview(notifyViewController.view)
        
    }
    
    static func getScreenBounds() -> CGRect {
        return UIScreen.main.bounds
    }
    
    static func getRootController() -> UIViewController {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.last?.rootViewController else {
            return .init()
        }
        return root
    }
    
}

@available(iOS 13.0, *)
struct ToastifyView: View {
    
    var title: String
    
    var image: String?
    var foregroundColor: Color?
    
    var background: Color?
    
    @State private var show: Bool = false
        
    var body: some View {
        
        HStack(spacing: 10) {
            
            if image != nil {
                
                Image(systemName: image!)
                    .font(.system(size: 17))
            }
            
            Text(title)
                .font(.subheadline)
            
        }
        .foregroundColor(foregroundColor ?? .primary)
        .padding(.vertical, 10)
        .padding(.horizontal)
        .background(background ?? Color.white)
        .clipShape(Capsule())
        .shadow(color: (foregroundColor ?? .primary).opacity(0.1), radius: 5, x: 1, y: 5)
        .shadow(color: (foregroundColor ?? .primary).opacity(0.03), radius: 5, x: 0, y: -5)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .offset(y: show ? 0 : -200)
        .onAppear {
            
            withAnimation(.spring()) {
                show = true
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                withAnimation(.spring()) {
                    show = false
                }
            }
            
            // xoá view
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                Toastify.getRootController().view.subviews.forEach { view in
                    if view.tag == 1009 {
                        
                        view.removeFromSuperview()
                        
                    }
                }
            }
            
        }
        
    }
}

struct ToastifyView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}

@available(iOS 13.0, *)
extension View {
    
    func showToastify(_ title: String, image: String? = nil, foregroundColor: Color = Color("Primary"), background: Color = .white) -> Void {
        return Toastify.show(title, image: image, foregroundColor: foregroundColor, background: background)
    }
    
}
