//
//  CustomBottomSheet.swift
//  FoodMix
//
//  Created by Yuan on 01/03/2022.
//

import SwiftUI

struct CustomBottomSheet<Content: View>: View {
    
    var minHeight: CGFloat
    var midHeight: CGFloat
    var maxHeight: CGFloat
    let content: Content
    let overlay: Bool
    
    @Binding var offset: CGFloat
    @GestureState private var dragState: CGFloat = .zero
    
        
    init(offset: Binding<CGFloat>, overlay: Bool = false, minHeight: CGFloat, midHeight: CGFloat, maxHeight: CGFloat, @ViewBuilder content: () -> Content) {
        self._offset = offset
        self.overlay = overlay
        self.minHeight = minHeight
        self.midHeight = midHeight
        self.maxHeight = maxHeight
        self.content = content()
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            if overlay && offset > minHeight {
                
                Color.black.opacity(0.0001)
                    .onTapGesture {
                        withAnimation {
                            offset = minHeight
                        }
                    }
                    .ignoresSafeArea()
                
            }
            
            VStack {
                
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray.opacity(0.4))
                    .frame(width: 40, height: 5)
                    .padding(.top)
                    .gesture(
                        
                        DragGesture()
                            .updating($dragState, body: { (value, state, transaction) in
                                changeHeight(change: value.translation.height)
                            })
                            .onEnded { value in
                                
                                if offset > maxHeight - 100 {
                                                                    
                                    withAnimation {
                                        offset = maxHeight
                                    }
                                                                    
                                } else if offset < minHeight + 100 {
                                                                    
                                    withAnimation {
                                        offset = minHeight
                                    }
                                                                    
                                } else {
                                                                    
                                    withAnimation {
                                       offset = midHeight
                                    }
                                                                    
                                }
                                
                            }
                        
                    )
                    .onTapGesture {
                        withAnimation {
                            if offset == maxHeight || offset == minHeight  {
                                
                                offset = midHeight
                                
                            }
                            else {
                                
                                offset = maxHeight
                                
                            }
                        }
                    }
                                                    
                content
                
            }
            .frame(maxHeight: offset)
            .onAppear {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation(.spring()) {
                        offset = midHeight
                    }
                }
                
            }
            
        }
        
    }
    
    func changeHeight(change: CGFloat) -> Void {
        
        
        
        DispatchQueue.main.async {
            offset += -change
        }
        
    }
}

struct CustomBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWrapper {
            
            ActivityView()
            
        }
    }
}


struct CustomSheetShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        

        let radius = CGFloat(40)


        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.minX + radius, y: rect.minY))
        
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.minY + radius), control: CGPoint(x: rect.minX, y: rect.minY))
            
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY + radius))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX - radius, y: rect.minY), control: CGPoint(x: rect.maxX, y: rect.minY))
        
        

        
        return path
    }
}
