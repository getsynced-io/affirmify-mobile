//
//  HalfASheet.swift
//
//  Created by Franklyn Weber on 28/01/2021.
//

import SwiftUI
import Combine


public struct HalfASheet<Content: View>: View {
    
    @Binding private var isPresented: Bool
    var isDragable: Bool = true
    @State private var hasAppeared = false
    @State private var dragOffset: CGFloat = 0
    
    internal var height: HalfASheetHeight = .proportional(0.84) // about the same as a ColorPicker
    internal var contentInsets = EdgeInsets(top: 7, leading: 16, bottom: 12, trailing: 16)
    internal var backgroundColor: UIColor = UIColor(named: "FFFFFF") ?? UIColor.white
    internal var closeButtonColor: UIColor = .gray
    internal var allowsDraggingToDismiss = true
    
   // private let title: String?
    private let content: () -> Content
    private let cornerRadius: CGFloat = 16
    private let additionalOffset: CGFloat = 44 // this is so we can drag the sheet up a bit
    
    private var actualContentInsets: EdgeInsets {
        return EdgeInsets(top: contentInsets.top, leading: contentInsets.leading, bottom: cornerRadius + additionalOffset + contentInsets.bottom, trailing: contentInsets.trailing)
    }
    let  backgroundHandler : ()->()
    
    public init(isPresented: Binding<Bool>,isDragable : Bool, @ViewBuilder content: @escaping () -> Content , backgroundHandler : @escaping ()->() = {} ) {
        _isPresented = isPresented
     
        self.isDragable = isDragable
        self.content = content
        self.backgroundHandler = backgroundHandler
    }
    
    
    public var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                if isPresented {
                    
                    Color("000000")
                        .opacity( 0.32 )
                        .ignoresSafeArea(.container, edges: .top)
                        .onTapGesture {
                            withAnimation {
                                isPresented = false
                            }
                            
                        }
                        .transition(.opacity)
                        .onAppear { // we don't want the content to slide up until the background has appeared
                            withAnimation {
                                hasAppeared = true
                            }
                        }
                        .zIndex(-2)

                }
                
                if hasAppeared {
               
                    VStack {
                        
                        Spacer(minLength: 0)
                            
                        ZStack(alignment: .top) {
                            
                           

                            Rectangle()
                                .cornerRadius(cornerRadius ,corners: [.topLeft , .topRight])
                                .foregroundColor(Color(backgroundColor))
                             
                            content()
                               // .padding(actualContentInsets)
                                
                            
                          
                        }
                        .frame(height: height.value(with: geometry) + cornerRadius + additionalOffset)
                        .offset(y: dragOffset + cornerRadius + additionalOffset)
                    }
              
                   .transition(.verticalSlide(height.value(with: geometry)))
                   .if(isDragable, transform: { view in
                       view
                           .highPriorityGesture(
                               dragGesture(geometry)
                           )
                   })
                 
                    .onDisappear {
                        backgroundHandler()
                        dragOffset = 0
                    }
                }
            }
            .onChange(of: isPresented) { newvalue in
                if !newvalue {
                    withAnimation {
                        hasAppeared = false
                    }
                }
            }
        }
        .zIndex(3)
    }
}


// MARK: - Private
extension HalfASheet {
    

    
    private func dragGesture(_ geometry: GeometryProxy) -> _EndedGesture<_ChangedGesture<DragGesture>> {
        
        let gesture = DragGesture()
            .onChanged {
                
                guard allowsDraggingToDismiss else {
                    return
                }
                
                let offset = $0.translation.height
                dragOffset = offset > 0 ? offset : sqrt(-offset) * -3
            }
            .onEnded {
                
                guard allowsDraggingToDismiss else {
                    return
                }
                
                if dragOffset > 0, $0.predictedEndTranslation.height / $0.translation.height > 2 {
                    dismiss()
                    return
                }
                
                let validDragDistance = height.value(with: geometry) / 2
                if dragOffset < validDragDistance {
                    withAnimation {
                        dragOffset = 0
                    }
                } else {
                    dismiss()
                }
            }
        
        return gesture
    }
    

    
    private func dismiss() {
        
        withAnimation {
            hasAppeared = false
            isPresented = false
        }
    }
}


public enum HalfASheetHeight {
    case fixed(CGFloat)
    case proportional(CGFloat)
    
    func value(with geometry: GeometryProxy) -> CGFloat {
        switch self {
        case .fixed(let height):
            return height
        case .proportional(let proportion):
            return geometry.size.height * proportion
        }
    }
}
