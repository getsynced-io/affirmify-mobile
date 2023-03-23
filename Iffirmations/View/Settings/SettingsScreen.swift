//
//  SettingsScreen.swift
//  Iffirmations
//
//  Created by Fares Cherni on 07/03/2023.
//

import SwiftUI

struct SettingsScreen: View , SettingsViewProtocol {
    @Environment(\.presentationMode) var presentationMode
    @State var pushView : Bool = false
    @State var viewToPush : AnyView  = AnyView(EmptyView())
    @AppStorage("WidgetCategory",store: store) var category: String = ""
    var body: some View {
        ZStack{
            Color._000000.ignoresSafeArea()
            VStack(spacing: 0) {
                SettingsHeaderView(title: "Settings", cancelHandler: {
                    withAnimation {
                        presentationMode.wrappedValue.dismiss()
                    }
                })
                .padding(.bottom , 16)
                
                
                listRow(title: "Personal Preferences") {
                    withAnimation {
                        viewToPush = AnyView(CategorySelectionView(calledFromConfiguration : true))
                        pushView = true
                    }
                }
                seperator
                
                listRow(title: "Reminders") {
                    withAnimation {
                        viewToPush = AnyView(NotificationTimeView(calledFromConfiguration: true))
                        pushView = true
                    }
                }
                seperator
                
                listRow(title: "Siri Shortcuts") {
                    withAnimation {
                        viewToPush = AnyView(SiriShortCutsScreen())
                        pushView = true
                    }
                }
                
                seperator
                
                listRow(title: "Widgets") {
                    withAnimation {
                        viewToPush = AnyView(WidgetsScreen(stateUndoManager : StateUndoManager(initialState: category)))
                        pushView = true
                    }
                }
                
                nextView
                
                Spacer(minLength: 0)
                
            }
            .background(Color._000000.ignoresSafeArea())
        }
    }
    var nextView : some View {
        CustomNavigationLink(isActive: $pushView) {
            viewToPush
                .background(
                    Color._F6F5EC.ignoresSafeArea()
                )
        }
    }
}


