//
//  UserConfigurationViewModel.swift
//  Iffirmations
//
//  Created by Fares Cherni on 21/02/2023.
//

import SwiftUI


class UserConfigurationVM : ObservableObject {
    static let shared  : UserConfigurationVM = UserConfigurationVM()
    @AppStorage("userConfig",store: store) var  userConfig :  UserConfiguration =  UserConfiguration(quantity: 5, from: Date(), to: Date().addHours(1))
}



extension UIApplication {
    func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
